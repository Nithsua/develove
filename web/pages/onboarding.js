import React, { useState } from "react";
import { useAuth } from "../lib/auth";
import { updateUser } from "../lib/signupComplete";

export default function OnBoarding() {
  const [userObject, setUserObject] = useState({
    fullName: "",
    tags: "",
    username: "",
  });

  const handleChange = (e) => {
    setUserObject({ ...userObject, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    let tagsToBeSent = [];
    tagsToBeSent = userObject.tags.split(",");
    console.log(tagsToBeSent);
    console.log(userObject);
    await updateUser(userObject.fullName, tagsToBeSent, userObject.username);
  };

  return (
    <div className="block text-center">
      <h1 className="text-3xl font-bold font-mono text-white mb-10 mt-40">
        Almost there! Join the awesomest community now! 🔥
      </h1>
      <form onSubmit={handleSubmit}>
        <div className="my-5">
          <label className="text-white text-2xl font-thin mr-10">
            Full Name
          </label>
          <input
            className="rounded-lg p-2"
            name="fullName"
            value={userObject.fullName}
            onChange={handleChange}
          />
        </div>
        <div className="my-5">
          <label className="text-white text-2xl font-thin mr-10">
            Your tags
          </label>
          {/* <select
            className="rounded-lg p-2"
            name="tags"
            // value={userObject.tags}
            onChange={handleChange}
            multiple
          >
            <option className="rounded-lg p-2" value="">
              Select Tags
            </option>
            <option value="javascript">Javascript</option>
            <option value="react">React</option>
            <option value="node">Node</option>
            <option value="express">Express</option>
          </select> */}
          <input
            className="rounded-lg p-2"
            name="tags"
            value={userObject.tags}
            onChange={handleChange}
          />
        </div>
        <div className="my-5">
          <label className="text-white text-2xl font-thin mr-10">
            Username
          </label>
          <input
            className="rounded-lg p-2"
            name="username"
            value={userObject.username}
            onChange={handleChange}
          />
        </div>

        <button
          className=" bg-primary-solid px-10 py-2 rounded-lg my-10"
          onSubmit={handleSubmit}
        >
          Submit
        </button>
      </form>
    </div>
  );
}
