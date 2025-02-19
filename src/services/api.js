import axios from 'axios';

const API_BASE_URL = 'https://api.recoverywise.com'; // Replace with your actual API base URL

// Function to track substance use
export const trackSubstanceUse = async (data) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/track`, data);
        return response.data;
    } catch (error) {
        console.error('Error tracking substance use:', error);
        throw error;
    }
};

// Function to get user tracking data
export const getUserTrackingData = async (userId) => {
    try {
        const response = await axios.get(`${API_BASE_URL}/tracking/${userId}`);
        return response.data;
    } catch (error) {
        console.error('Error fetching user tracking data:', error);
        throw error;
    }
};

// Function to submit user goals
export const submitUserGoals = async (userId, goals) => {
    try {
        const response = await axios.post(`${API_BASE_URL}/goals/${userId}`, goals);
        return response.data;
    } catch (error) {
        console.error('Error submitting user goals:', error);
        throw error;
    }
};

// Function to get community resources
export const getCommunityResources = async () => {
    try {
        const response = await axios.get(`${API_BASE_URL}/resources`);
        return response.data;
    } catch (error) {
        console.error('Error fetching community resources:', error);
        throw error;
    }
};