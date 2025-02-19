import React, { useState } from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';

const CaffeineWise = () => {
  const [caffeineIntake, setCaffeineIntake] = useState(0);

  return (
    <View style={styles.container}>
      <Text style={styles.title}>CaffeineWise Tracker</Text>
      <View style={styles.statsContainer}>
        <Text style={styles.statsText}>Today's Intake: {caffeineIntake}mg</Text>
      </View>
      <View style={styles.buttonContainer}>
        <TouchableOpacity 
          style={styles.button}
          onPress={() => setCaffeineIntake(prev => prev + 80)}
        >
          <Text style={styles.buttonText}>Add Coffee (80mg)</Text>
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
  statsContainer: {
    backgroundColor: '#f0f0f0',
    padding: 20,
    borderRadius: 10,
    marginBottom: 20,
  },
  statsText: {
    fontSize: 18,
  },
  buttonContainer: {
    gap: 10,
  },
  button: {
    backgroundColor: '#4A90E2',
    padding: 15,
    borderRadius: 10,
    alignItems: 'center',
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: 'bold',
  },
});

export default CaffeineWise;
