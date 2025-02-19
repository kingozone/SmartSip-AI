import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import Header from '../components/Header';
import Footer from '../components/Footer';

const SettingsScreen = () => {
    return (
        <View style={styles.container}>
            <Header />
            <Text style={styles.title}>Settings</Text>
            <Text style={styles.description}>Manage your preferences and account settings here.</Text>
            {/* Additional settings options will be added here */}
            <Footer />
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
        marginBottom: 10,
    },
    description: {
        fontSize: 16,
        marginBottom: 20,
    },
});

export default SettingsScreen;