select t.*
 FROM MEETING_REGIST t
 WHERE 1=1 and t.FLAG = '1' and ( '2020-04-13 00:00:00.246' <= t.MEETING_START_TIME and t.MEETING_START_TIME <= '2020-04-19 23:59:59.246') and (t.PARTICIPATION_SCOPE_ALL = '1' or t.CREATOR_ID = '2' or t.PARTICIPATION_SCOPE_DEPTIDS like '%:1:%' or t.PARTICIPATION_SCOPE_DEPTIDS like '%:1:%' or t.PARTICIPATION_SCOPE_USERIDS like '%:2:%' or t.PARTICIPATION_SCOPE_USERIDS like '%:2:%' );

 delete from WF_HISTORY_TASK_INFO where  1=1;
 delete from WF_CURRENT_TASK_INFO where  1=1;
 delete from WF_FORM_COMMON where  1=1;
 delete from WF_PROCESS_INSTANCE where  1=1;


/*遍历*/
SELECT id ,
       SYS_CONNECT_BY_PATH(INSERTED_TASK_ID, '\') AS INDU_NAME
FROM   WF_HISTORY_TASK_INFO
where id = 969913
START  WITH FROM_TASK_ID is null
CONNECT BY PRIOR   INSERTED_TASK_ID  = FROM_TASK_ID;

/*溯源 谁在前谁是目标*/
SELECT FROM_TASK_ID , FROM_NODE_ID,
       SYS_CONNECT_BY_PATH(INSERTED_TASK_ID, '\') AS tree
FROM   WF_HISTORY_TASK_INFO
where  FROM_TASK_ID in (
                    SELECT FROM_TASK_ID
                    FROM   WF_HISTORY_TASK_INFO
                    where  FROM_NODE_ID = 7 and TASK_HIS_SHOW_TAG = 'Yes'
                    START  WITH  INSERTED_TASK_ID in (969944)
                    CONNECT BY PRIOR  FROM_TASK_ID   =  INSERTED_TASK_ID
                    )
START  WITH  INSERTED_TASK_ID in (select id from WF_CURRENT_TASK_INFO where PRO_INST_ID = 969915 and id != 969944)
CONNECT BY PRIOR  FROM_TASK_ID   =  INSERTED_TASK_ID ;

select 1  from dual where  exists (
    SELECT FROM_TASK_ID
    FROM   WF_HISTORY_TASK_INFO
    where  FROM_TASK_ID in (
                    SELECT FROM_TASK_ID
                    FROM   WF_HISTORY_TASK_INFO
                    where  FROM_NODE_ID = 7 and TASK_HIS_SHOW_TAG = 'Yes'
                    START  WITH  INSERTED_TASK_ID in (969944)
                    CONNECT BY PRIOR  FROM_TASK_ID   =  INSERTED_TASK_ID
                    )
    START  WITH  INSERTED_TASK_ID in (
                                select id from WF_CURRENT_TASK_INFO where PRO_INST_ID = 969915 and id != 969944
                                )
    CONNECT BY PRIOR  FROM_TASK_ID   =  INSERTED_TASK_ID
);



update WF_HISTORY_TASK_INFO set  FROM_TASK_ID = null   where  FROM_TASK_ID = INSERTED_TASK_ID;

select INSERTED_TASK_ID,PRO_INST_ID from WF_HISTORY_TASK_INFO where INSERTED_TASK_ID = 969944;
