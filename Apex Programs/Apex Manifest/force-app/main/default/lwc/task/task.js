import { LightningElement } from 'lwc';

export default class FinancialDashboard extends LightningElement {
    // Properties to bind to the HTML template
    ratingCode = '5AA4';
    riskClass = 'high-risk'; // You can change this based on conditions
    riskLevel = 'High Risk';
    financialEmbarrassment = 'A Financial Embarrassment Present';
    failureScore = 78;
    paymentDays = 35;
}