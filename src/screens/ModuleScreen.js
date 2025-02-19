import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import DrinkWise from '../modules/DrinkWise';
import WeedWise from '../modules/WeedWise';
import Nicotine from '../modules/Nicotine';
import Caffeine from '../modules/Caffeine';

const ModuleScreen = () => {
    return (
        <View style={styles.container}>
            <Text style={styles.title}>Specialized Modules</Text>
            <DrinkWise />
            <WeedWise />
            <Nicotine />
            <Caffeine />
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
});

export default ModuleScreen;