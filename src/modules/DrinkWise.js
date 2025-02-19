import React, { useState } from 'react';
import { View, Text, TextInput, Button, StyleSheet } from 'react-native';

const DrinkWise = () => {
    const [drinkType, setDrinkType] = useState('');
    const [quantity, setQuantity] = useState('');
    const [bac, setBac] = useState(null);

    const calculateBAC = () => {
        // Simple BAC calculation logic (for demonstration purposes)
        const weight = 70; // Example weight in kg
        const alcoholConsumed = quantity * 0.6; // Assuming 0.6 oz of alcohol per drink
        const bacValue = (alcoholConsumed / (weight * 0.55)) * 100; // BAC formula
        setBac(bacValue.toFixed(3));
    };

    const logDrink = () => {
        // Logic to log the drink (e.g., save to a database or state)
        console.log(`Logged: ${quantity} of ${drinkType}`);
    };

    return (
        <View style={styles.container}>
            <Text style={styles.title}>DrinkWise Module</Text>
            <TextInput
                style={styles.input}
                placeholder="Type of Drink"
                value={drinkType}
                onChangeText={setDrinkType}
            />
            <TextInput
                style={styles.input}
                placeholder="Quantity (oz)"
                value={quantity}
                onChangeText={setQuantity}
                keyboardType="numeric"
            />
            <Button title="Calculate BAC" onPress={calculateBAC} />
            {bac !== null && <Text style={styles.bacText}>Estimated BAC: {bac}</Text>}
            <Button title="Log Drink" onPress={logDrink} />
        </View>
    );
};

const styles = StyleSheet.create({
    container: {
        padding: 20,
    },
    title: {
        fontSize: 24,
        fontWeight: 'bold',
        marginBottom: 20,
    },
    input: {
        height: 40,
        borderColor: 'gray',
        borderWidth: 1,
        marginBottom: 10,
        paddingHorizontal: 10,
    },
    bacText: {
        marginTop: 10,
        fontSize: 18,
    },
});

export default DrinkWise;