var express = require('express');
var router = express.Router();
var pool = require("./pool")
var upload = require("./multer");
/* GET home page. */
router.post('/submit_assetentry', upload.single("document"), function (req, res, next) {
    console.log("Form Data:", req.body);
    console.log("Uploaded File:", req.file);

    try {
        pool.query(
            "INSERT INTO assetentry (assettype, jurisdiction, assetvalue, tokensupply, document) VALUES ($1, $2, $3, $4, $5)",
            [
                req.body.assettype,
                req.body.jurisdiction,
                req.body.assetvalue,
                req.body.tokensupply,
                req.file?.filename || ""
            ],
            function (error, result) {
                if (error) {
                    console.log("Database Error:", error);
                    return res.status(500).json({
                        status: false,
                        message: "Database Error, Please contact admin"
                    });
                } else {
                    return res.status(200).json({
                        status: true,
                        message: "Asset Entry Submitted Successfully!"
                    });
                }
            }
        );
    } catch (e) {
        console.error("Server Error:", e);
        return res.status(500).json({
            status: false,
            message: "Server Error...!"
        });
    }
});





router.post('/delete_category', function (req, res, next) {
    console.log(req.body)
    console.log(req.file)
    try {
        pool.query("delete from category where categoryid=?", [req.body.categoryid], function (error, result) {
            if (error) {
                console.log(error)
               return res.status(500).json({ status: false, message: "DataBase Error, Plz Contact DataBase Admin" })
            }
            else {
               return res.status(200).json({ status: true, message: "Category Deleted Successfully!" })
            }
        })
    }
    catch (e) {
      return  res.status(500).json({ status: false, message: "Server Error...!" })

    }
});
router.get("/display_all_assetentry", function(req, res, next) {
  try {
    pool.query("SELECT * FROM assetentry", function(error, result) {
      if (error) {
        console.error(error);
        return res.status(500).json({ status: false, message: "Database Error, Please contact admin" });
      } else {
        return res.status(200).json({ data: result.rows, status: true, message: "Success!" });
      }
    });
  } catch (e) {
    console.error(e);
    return res.status(500).json({ status: false, message: "Server Error" });
  }
});

module.exports = router;