import React, { useState } from 'react';

const Caffeine = () => {
    const [caffeineIntake, setCaffeineIntake] = useState('');
    const [suggestions, setSuggestions] = useState([]);

    const handleInputChange = (e) => {
        setCaffeineIntake(e.target.value);
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        // Logic to analyze caffeine intake and suggest alternatives
        const alternatives = suggestAlternatives(caffeineIntake);
        setSuggestions(alternatives);
    };

    const suggestAlternatives = (intake) => {
        // Placeholder logic for suggesting alternatives based on intake
        if (intake > 400) {
            return ['Herbal Tea', 'Decaf Coffee', 'Water'];
        }
        return ['Coffee', 'Tea', 'Energy Drinks'];
    };

    return (
        <div>
            <h2>Caffeine Tracker</h2>
            <form onSubmit={handleSubmit}>
                <input
                    type="number"
                    value={caffeineIntake}
                    onChange={handleInputChange}
                    placeholder="Enter caffeine intake (mg)"
                />
                <button type="submit">Submit</button>
            </form>
            {suggestions.length > 0 && (
                <div>
                    <h3>Suggested Alternatives:</h3>
                    <ul>
                        {suggestions.map((suggestion, index) => (
                            <li key={index}>{suggestion}</li>
                        ))}
                    </ul>
                </div>
            )}
        </div>
    );
};

export default Caffeine;