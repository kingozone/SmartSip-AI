import React from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';

const SettingsScreen = () => {
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Settings</Text>
      <View style={styles.settingsContainer}>
        <TouchableOpacity style={styles.settingItem}>
          <Text style={styles.settingText}>Notifications</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.settingItem}>
          <Text style={styles.settingText}>Profile</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.settingItem}>
          <Text style={styles.settingText}>Privacy</Text>
        </TouchableOpacity>
        <TouchableOpacity style={styles.settingItem}>
          <Text style={styles.settingText}>About</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    flex: 1,
    padding: 20,
    backgroundColor: '#fff',
  },
  title: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
  },
  settingsContainer: {
    gap: 10,
  },
  settingItem: {
    padding: 15,
    backgroundColor: '#f0f0f0',
    borderRadius: 10,
  },
  settingText: {
    fontSize: 16,
  },
});

export default SettingsScreen;
