import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import Header from '../components/Header';
import Footer from '../components/Footer';

const HomeScreen = () => {
    return (
        <View style={styles.container}>
            <Header />
            <Text style={styles.title}>Welcome to RecoveryWise</Text>
            <Text style={styles.description}>
                Your comprehensive platform for substance use recovery and support.
            </Text>
            <Text style={styles.featuresTitle}>Features:</Text>
            <Text style={styles.features}>
                - Track your substance use
                {'\n'}- Identify triggers
                {'\n'}- Develop coping mechanisms
                {'\n'}- Connect with a supportive community
            </Text>
            <Footer />
        </View>
    );
};

const styles = StyleSheet.create({
    container: {
        flex: 1,
        padding: 20,
        backgroundColor: '#f5f5f5',
    },
    title: {
        fontSize: 24,
        fontWeight: 'bold',
        marginVertical: 20,
    },
    description: {
        fontSize: 16,
        marginBottom: 20,
    },
    featuresTitle: {
        fontSize: 18,
        fontWeight: 'bold',
        marginTop: 20,
    },
    features: {
        fontSize: 16,
        marginTop: 10,
    },
});

export default HomeScreen;