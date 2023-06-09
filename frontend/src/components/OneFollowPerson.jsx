import React from "react";
import css from "../styles/oneFollowPerson.module.css";
import { SlUserFollowing } from "react-icons/sl";

const OneFollowPerson = ({ oneFollower }) => {
  return (
    <div className={css.personItem}>
      <div className={css.left}>
        <span>@{oneFollower.username}</span>
      </div>
      <div className={css.right}>
        <button className={css.followButton}>
          <SlUserFollowing size={20} />
          <span>Following</span>
        </button>
      </div>
    </div>
  );
};

export default OneFollowPerson;
