import React, { useState } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import Button from '../components/Button';

const Caffeine = () => {
  const [intakeCount, setIntakeCount] = useState(0);
  const [lastIntakeTime, setLastIntakeTime] = useState(null);

  const trackIntake = (amount) => {
    setIntakeCount(intakeCount + 1);
    setLastIntakeTime(new Date().toLocaleTimeString());
    // Here you would typically also save this data to your backend/storage
  };

  return (
    <View style={styles.container}>
      <Text style={styles.title}>Caffeine Tracker</Text>
      
      <View style={styles.statsContainer}>
        <Text style={styles.statsText}>Today's Intake: {intakeCount}</Text>
        {lastIntakeTime && (
          <Text style={styles.statsText}>Last Intake: {lastIntakeTime}</Text>
        )}
      </View>

      <View style={styles.buttonContainer}>
        <Button 
          title="Coffee (95mg)" 
          onPress={() => trackIntake(95)}
          style={styles.trackingButton}
        />
        <Button 
          title="Energy Drink (80mg)" 
          onPress={() => trackIntake(80)}
          style={styles.trackingButton}
        />
        <Button 
          title="Tea (47mg)" 
          onPress={() => trackIntake(47)}
          style={styles.trackingButton}
        />
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
    textAlign: 'center',
  },
  statsContainer: {
    backgroundColor: '#f5f5f5',
    padding: 15,
    borderRadius: 8,
    marginBottom: 20,
  },
  statsText: {
    fontSize: 16,
    marginBottom: 10,
  },
  buttonContainer: {
    gap: 10,
  },
  trackingButton: {
    marginVertical: 5,
  },
});

export default Caffeine;
