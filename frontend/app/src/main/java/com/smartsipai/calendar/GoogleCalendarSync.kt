package com.smartsipai.calendar

import android.content.Context
import android.provider.CalendarContract
import android.provider.CalendarContract.Events
import android.util.Log
import java.util.*

object GoogleCalendarSync {

    fun insertAlcoholEvent(context: Context, drinkType: String, timestamp: Long) {
        val calId: Long = getPrimaryCalendarId(context) ?: return

        val startMillis = timestamp
        val endMillis = startMillis + 60 * 60 * 1000 // 1 hour duration

        val values = android.content.ContentValues().apply {
            put(Events.DTSTART, startMillis)
            put(Events.DTEND, endMillis)
            put(Events.TITLE, "Alcohol consumed: $drinkType")
            put(Events.DESCRIPTION, "Auto-logged by SmartSip AI")
            put(Events.CALENDAR_ID, calId)
            put(Events.EVENT_TIMEZONE, TimeZone.getDefault().id)
        }

        val uri = context.contentResolver.insert(CalendarContract.Events.CONTENT_URI, values)
        Log.d("CalendarSync", "Inserted calendar event: $uri")
    }

    private fun getPrimaryCalendarId(context: Context): Long? {
        val projection = arrayOf(
            CalendarContract.Calendars._ID,
            CalendarContract.Calendars.IS_PRIMARY
        )

        val uri = CalendarContract.Calendars.CONTENT_URI
        val cursor = context.contentResolver.query(uri, projection, null, null, null)

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
