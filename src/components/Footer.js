import React from 'react';

const Footer = () => {
    return (
        <footer style={{ textAlign: 'center', padding: '1rem', backgroundColor: '#f1f1f1' }}>
            <p>&copy; {new Date().getFullYear()} RecoveryWise. All rights reserved.</p>
            <div>
                <a href="/privacy-policy">Privacy Policy</a> | 
                <a href="/terms-of-service">Terms of Service</a>
            </div>
        </footer>
    );
};

export default Footer;