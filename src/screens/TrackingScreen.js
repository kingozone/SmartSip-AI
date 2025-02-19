import React, { useState } from 'react';
import { View, Text, TextInput, Button, ScrollView } from 'react-native';
import Header from '../components/Header';
import Footer from '../components/Footer';

const TrackingScreen = () => {
    const [substance, setSubstance] = useState('');
    const [quantity, setQuantity] = useState('');
    const [time, setTime] = useState('');
    const [location, setLocation] = useState('');
    const [trigger, setTrigger] = useState('');

    const handleTrack = () => {
        // Logic to handle tracking submission
        console.log('Tracking:', { substance, quantity, time, location, trigger });
    };

    return (
        <View style={{ flex: 1 }}>
            <Header />
            <ScrollView contentContainerStyle={{ padding: 20 }}>
                <Text style={{ fontSize: 24, marginBottom: 20 }}>Track Your Substance Use</Text>
                <TextInput
                    placeholder="Substance"
                    value={substance}
                    onChangeText={setSubstance}
                    style={{ borderWidth: 1, marginBottom: 10, padding: 10 }}
                />
                <TextInput
                    placeholder="Quantity"
                    value={quantity}
                    onChangeText={setQuantity}
                    style={{ borderWidth: 1, marginBottom: 10, padding: 10 }}
                />
                <TextInput
                    placeholder="Time"
                    value={time}
                    onChangeText={setTime}
                    style={{ borderWidth: 1, marginBottom: 10, padding: 10 }}
                />
                <TextInput
                    placeholder="Location"
                    value={location}
                    onChangeText={setLocation}
                    style={{ borderWidth: 1, marginBottom: 10, padding: 10 }}
                />
                <TextInput
                    placeholder="Trigger"
                    value={trigger}
                    onChangeText={setTrigger}
                    style={{ borderWidth: 1, marginBottom: 20, padding: 10 }}
                />
                <Button title="Track" onPress={handleTrack} />
            </ScrollView>
            <Footer />
        </View>
    );
};

export default TrackingScreen;