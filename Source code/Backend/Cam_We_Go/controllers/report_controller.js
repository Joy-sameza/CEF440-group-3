const Report = require('../models/report_model');


// Adding new report in the database
const create_report = (req, res) => {
    const { nature, description, filelink, userId } = req.body;

    const newReport = new Report({
        nature,
        description,
        filelink,
        userId  
    });

    // Saving the report to the database
    newReport.save()
        .then(savedReport => {
            res.status(201).json(savedReport); // HTTP 201 for created
        })
        .catch(err => {
            console.error('Error saving report:', err);
            res.status(500).json({ error: 'Failed to add report' });
        });
};

// Getting all reports from the database
const all_reports = (req, res) => {
    Report.find().sort({ timestamp: -1 }) // Sorting by timestamp in descending order
        .then(reports => {
            res.json(reports);
        })
        .catch(err => {
            console.error('Error fetching reports:', err);
            res.status(500).json({ error: 'Failed to fetch reports' });
        });
};

// Deleting a report from the database by ID
const delete_report = (req, res) => {
    const { reportId } = req.params.reportId;

    Report.findByIdAndDelete(reportId)
        .then(deletedReport => {
            if (!deletedReport) {
                return res.status(404).json({ error: 'Report not found' });
            }
            res.json(deletedReport);
        })
        .catch(err => {
            console.error('Error deleting report:', err);
            res.status(500).json({ error: 'Failed to delete report' });
        });
}



module.exports = {
    create_report,
    all_reports,
    delete_report
}