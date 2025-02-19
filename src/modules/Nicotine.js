import React, { useState } from 'react';

const Nicotine = () => {
    const [cigarettes, setCigarettes] = useState(0);
    const [vapeUsage, setVapeUsage] = useState(0);
    const [cravings, setCravings] = useState([]);

    const handleCigaretteChange = (e) => {
        setCigarettes(e.target.value);
    };

    const handleVapeChange = (e) => {
        setVapeUsage(e.target.value);
    };

    const addCraving = (craving) => {
        setCravings([...cravings, craving]);
    };

    return (
        <div>
            <h1>Nicotine Tracker</h1>
            <div>
                <label>
                    Cigarettes Smoked:
                    <input type="number" value={cigarettes} onChange={handleCigaretteChange} />
                </label>
            </div>
            <div>
                <label>
                    Vape Usage (puffs):
                    <input type="number" value={vapeUsage} onChange={handleVapeChange} />
                </label>
            </div>
            <div>
                <h2>Cravings</h2>
                <input type="text" placeholder="Describe your craving" onKeyDown={(e) => {
                    if (e.key === 'Enter') {
                        addCraving(e.target.value);
                        e.target.value = '';
                    }
                }} />
                <ul>
                    {cravings.map((craving, index) => (
                        <li key={index}>{craving}</li>
                    ))}
                </ul>
            </div>
        </div>
    );
};

export default Nicotine;