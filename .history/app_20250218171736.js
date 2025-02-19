import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { SafeAreaProvider } from 'react-native-safe-area-context';

// Import your screens
import HomeScreen from './src/screens/HomeScreen';
import CaffeineWiseScreen from './src/modules/CaffeineWise';
import NicotineWiseScreen from './src/modules/NicotineWise';
import WeedWiseScreen from './src/modules/WeedWise';
import SettingsScreen from './src/screens/SettingsScreen';

const Stack = createNativeStackNavigator();

export default function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Stack.Navigator
          initialRouteName="Home"
          screenOptions={{
            headerStyle: {
              backgroundColor: '#4A90E2',
            },
            headerTintColor: '#fff',
            headerTitleStyle: {
              fontWeight: 'bold',
            },
          }}
        >
          <Stack.Screen 
            name="Home" 
            component={HomeScreen} 
            options={{ title: 'RecoveryWise' }}
          />
          <Stack.Screen 
            name="CaffeineWise" 
            component={CaffeineWiseScreen} 
            options={{ title: 'CaffeineWise Tracker' }}
          />
          <Stack.Screen 
            name="NicotineWise" 
            component={NicotineWiseScreen} 
            options={{ title: 'NicotineWise Tracker' }}
          />
          <Stack.Screen 
            name="WeedWise" 
            component={WeedWiseScreen} 
            options={{ title: 'WeedWise Tracker' }}
          />
          <Stack.Screen 
            name="Settings" 
            component={SettingsScreen} 
            options={{ title: 'Settings' }}
          />
        </Stack.Navigator>
      </NavigationContainer>
    </SafeAreaProvider>import React from 'react';
import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { SafeAreaProvider } from 'react-native-safe-area-context';

// Import your screens
import HomeScreen from './src/screens/HomeScreen';
import CaffeineWiseScreen from './src/modules/CaffeineWise';
import NicotineWiseScreen from './src/modules/NicotineWise';
import WeedWiseScreen from './src/modules/WeedWise';
import SettingsScreen from './src/screens/SettingsScreen';

const Stack = createNativeStackNavigator();

export default function App() {
  return (
    <SafeAreaProvider>
      <NavigationContainer>
        <Stack.Navigator
          initialRouteName="Home"
          screenOptions={{
            headerStyle: {
              backgroundColor: '#4A90E2',
            },
            headerTintColor: '#fff',
            headerTitleStyle: {
              fontWeight: 'bold',
            },
          }}
        >
          <Stack.Screen 
            name="Home" 
            component={HomeScreen} 
            options={{ title: 'RecoveryWise' }}
          />
          <Stack.Screen 
            name="CaffeineWise" 
            component={CaffeineWiseScreen} 
            options={{ title: 'CaffeineWise Tracker' }}
          />
          <Stack.Screen 
            name="NicotineWise" 
            component={NicotineWiseScreen} 
            options={{ title: 'NicotineWise Tracker' }}
          />
          <Stack.Screen 
            name="WeedWise" 
            component={WeedWiseScreen} 
            options={{ title: 'WeedWise Tracker' }}
          />
          <Stack.Screen 
            name="Settings" 
            component={SettingsScreen} 
            options={{ title: 'Settings' }}
          />
        </Stack.Navigator>
      </NavigationContainer>
    </SafeAreaProvider>
  );
}

  );
}
