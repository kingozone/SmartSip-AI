package com.smartsipai.calendar

import android.content.ContentValues
import android.content.Context
import android.provider.CalendarContract
import android.util.Log
import java.util.*

object GoogleCalendarSync {

    fun insertAlcoholEvent(context: Context, drinkType: String, timestamp: Long) {
        val calId = getPrimaryCalendarId(context) ?: return
        val values = ContentValues().apply {
            put(CalendarContract.Events.DTSTART, timestamp)
            put(CalendarContract.Events.DTEND, timestamp + 60 * 60 * 1000)
            put(CalendarContract.Events.TITLE, "Drink logged: $drinkType")
            put(CalendarContract.Events.CALENDAR_ID, calId)
            put(CalendarContract.Events.EVENT_TIMEZONE, TimeZone.getDefault().id)
        }
        val uri = context.contentResolver.insert(CalendarContract.Events.CONTENT_URI, values)
        Log.d("CalendarSync", "Inserted calendar event: $uri")
    }

    private fun getPrimaryCalendarId(context: Context): Long? {
        val projection = arrayOf(CalendarContract.Calendars._ID, CalendarContract.Calendars.IS_PRIMARY)
        val cursor = context.contentResolver.query(CalendarContract.Calendars.CONTENT_URI, projection, null, null, null)

        cursor?.use {
            while (it.moveToNext()) {
                val calId = it.getLong(0)
                val isPrimary = it.getInt(1) == 1
                if (isPrimary) return calId
            }
        }
        return null
    }
}
