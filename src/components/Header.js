import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { TouchableOpacity } from 'react-native-gesture-handler';

const Header = ({ title, navigation }) => {
    return (
        <View style={styles.header}>
            <Text style={styles.title}>{title}</Text>
            <View style={styles.navLinks}>
                <TouchableOpacity onPress={() => navigation.navigate('Home')}>
                    <Text style={styles.link}>Home</Text>
                </TouchableOpacity>
                <TouchableOpacity onPress={() => navigation.navigate('Tracking')}>
                    <Text style={styles.link}>Tracking</Text>
                </TouchableOpacity>
                <TouchableOpacity onPress={() => navigation.navigate('Modules')}>
                    <Text style={styles.link}>Modules</Text>
                </TouchableOpacity>
                <TouchableOpacity onPress={() => navigation.navigate('Settings')}>
                    <Text style={styles.link}>Settings</Text>
                </TouchableOpacity>
            </View>
        </View>
    );
};

const styles = StyleSheet.create({
    header: {
        backgroundColor: '#4CAF50',
        padding: 15,
        alignItems: 'center',
        flexDirection: 'row',
        justifyContent: 'space-between',
    },
    title: {
        color: '#fff',
        fontSize: 20,
        fontWeight: 'bold',
    },
    navLinks: {
        flexDirection: 'row',
    },
    link: {
        color: '#fff',
        marginLeft: 15,
        fontSize: 16,
    },
});

export default Header;