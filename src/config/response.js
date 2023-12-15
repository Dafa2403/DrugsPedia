"use strict";

exports.ok = (values, res) => {
  // let data = {
  //   values,
  // };
  res.json(values);
  res.end();
};
