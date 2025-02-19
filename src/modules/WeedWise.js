import React, { useState } from 'react';

const WeedWise = () => {
    const [dosage, setDosage] = useState('');
    const [strain, setStrain] = useState('');
    const [dosageHistory, setDosageHistory] = useState([]);

    const handleDosageChange = (e) => {
        setDosage(e.target.value);
    };

    const handleStrainChange = (e) => {
        setStrain(e.target.value);
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        if (dosage && strain) {
            setDosageHistory([...dosageHistory, { dosage, strain }]);
            setDosage('');
            setStrain('');
        }
    };

    return (
        <div>
            <h2>WeedWise Module</h2>
            <form onSubmit={handleSubmit}>
                <div>
                    <label>
                        Dosage:
                        <input type="text" value={dosage} onChange={handleDosageChange} />
                    </label>
                </div>
                <div>
                    <label>
                        Strain:
                        <input type="text" value={strain} onChange={handleStrainChange} />
                    </label>
                </div>
                <button type="submit">Log Dosage</button>
            </form>
            <h3>Dosage History</h3>
            <ul>
                {dosageHistory.map((entry, index) => (
                    <li key={index}>
                        {entry.dosage} - {entry.strain}
                    </li>
                ))}
            </ul>
        </div>
    );
};

export default WeedWise;