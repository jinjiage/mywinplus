package com.demo.dao.jinge;

import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.data.domain.Page;

import com.demo.model.Subject;

public class SubjectRepositoryImpl implements SubjectDao {

	@PersistenceContext
	EntityManager entityManager;

	public List<Object[]> findIndexList() {
		String sql = "select s.name,s.year_rate,s.floor_amount,s.period,s.bought from SUBJECT s ";
		List<Object[]> sublist=entityManager.createNativeQuery(sql).getResultList();
		return sublist;
	}

	public List<Object[]> getPagePayment(Integer pageNum, Integer pageSize, Subject subject) {
		String sql = "select * from (select aaa.*,rownum rid from (select s.id,s.serial_no,s.type,s.name ,"
				+ "s.amount,rrr.abc, s.period ,s.floor_amount,s.year_rate,s.status,s.exper_status,s.create_date "
				+ " from subject s left join (select  sum(r.amount)+sum(sb.amount) abc, "
				+ "r.subject_id ids from subject_purchase_record  r ,bbin_purchase_record sb where sb.subject_id =r.subject_id "
				+ "  group by r.subject_id) rrr on rrr.ids = s.id) aaa where 1=1 ";
		if(subject.getName()!=null&&!subject.getName().equals("")){
			sql+=" and aaa.name like '%"+subject.getName().trim()+"%'";
		}
		if(subject.getType()!=null&&subject.getType()!=-1){
			sql+=" and aaa.type = "+subject.getType();
		}
		if(subject.getStatus()!=null&&subject.getStatus()!=-1){
			sql+=" and aaa.status ="+subject.getStatus();
		}
		sql+=" and rownum <= "+pageSize+"*"+pageNum+" )where rid >"+pageSize+"*("+pageNum+"-1) ";
		Query query = entityManager.createNativeQuery(sql);
		List<Object[]> list =  query.getResultList();
		return list;
	}

	public Integer getSubjectCount(Subject subject) {
		String sql = "select count(*) from subject where 1=1 ";
		if(subject.getName()!=null&&!subject.getName().equals("")){
			sql+=" and name like '%"+subject.getName().trim()+"%'";
		}
		if(subject.getType()!=null&&subject.getType()!=-1){
			sql+=" and type = "+subject.getType();
		}
		if(subject.getStatus()!=null&&subject.getStatus()!=-1){
			sql+=" and status ="+subject.getStatus();
		}
		Query query = entityManager.createNativeQuery(sql);
		Integer count =  Integer.parseInt(query.getSingleResult().toString());
		return count;
	}

	public List<Object[]> find(Integer pageNum, Integer pageSize,Map<String, Object> map) {
		String sql = "select s.serial_no,s.type,s.name ,s.amount,rrr.abc, rrr.cout , s.period ,s.year_rate,s.status,"
				+ "s.exper_status from subject s left join (select count(*) cout,  sum(r.amount)+sum(sb.amount) abc,"
				+ "r.subject_id ids from subject_purchase_record  r ,bbin_purchase_record sb where"
				+ " sb.subject_id =r.subject_id group by r.subject_id) rrr on rrr.ids = s.id";
		System.out.println(map.get("subject")+"===========");
		
		if(map.get("subject")!=null&&!map.get("subject").equals("")){
			sql+=" and s.name like '%"+map.get("subject")+"%'";
		}
		
		Query query = entityManager.createNativeQuery(sql);
	   query.setFirstResult((pageNum-1)*pageSize);		
		List<Object[]> list =query.setMaxResults(pageSize).getResultList();
		return list;
	}
	
	public Integer SubjectCount(Map<String, Object> map) {
		
/*		 */
		String sql = "select count(*)    from subject s left join (select count(*) cout,  sum(r.amount)+sum(sb.amount) abc,"
				+ "r.subject_id ids from subject_purchase_record  r ,bbin_purchase_record sb where"
				+ " sb.subject_id =r.subject_id group by r.subject_id) rrr on rrr.ids = s.id";
		if(map.get("subject")!=null&&!map.get("subject").equals("")){
			sql+=" and s.name like '%"+map.get("subject")+"%'";
		}
		Query query = entityManager.createNativeQuery(sql);
		Integer count =Integer.parseInt(query.getSingleResult().toString());
		return count;
	}
	public List<Object[]> jingli(Integer pageNum, Integer pageSize, Map<String, Object> map) {
    String sql = "select  a.id ,  m.mobile_Phone,  m.member_name,m.invitationCode,m.invitedCode,me.invest_amount ,a.type,  a.isAward  , me.create_date ,a.invitingid,a.byinvitingid,a.amount, me.useable_balance"
   +"     from    member m inner  join   member_account  me  on  me.member_id=m.id   left  join  award_records a  on  a.invitingid=m.id";
		List<Object[]> list =entityManager.createNativeQuery(sql).getResultList();
		 return list;	
	}

	public List<Object[]> yongjingren(Integer id) {
	
       String sql = "select  m.mobile_Phone,  a.type   ,a.amount ,a.addTime  from  member m  , award_records a  where  a. byinvitingid=m.id  "
				    +"and  a.invitingid= "+id;
      
		List<Object[]> list =entityManager.createNativeQuery(sql).getResultList();
	     return list;	
		

	}

	public List<Object[]> tiyanfuxi(Integer id) {
	
		String  sql="select  s.type, s.period,s. year_rate,  bb.serial_number, m.mobile_phone ,m.member_name,m.identity , bbin.amont ,bb.interest , bb.pay_interest_times , bb.ispayment from  subject  s  ,member  m , bbin_purchase_record   bb , bbin_info  bbin  where bb.member_id=m.id and bb.subject_id=s.id  and  bbin.member_id=m.id  and  s.type="+id;
		   List<Object[]> list =entityManager.createNativeQuery(sql).getResultList();
		  return list;
	}

	public List<Object[]> tiyanfuxi(Integer id, Integer fid) {
		
		
		
		return null;
	}

	public List<Object[]> xt() {
		
     String sql = "select u1.id ,u1.user_name,u3.cname,u1.mobile_phone,u1.create_date from users u1 ,user_role_relation u2,user_role u3 where u1.id =u2.id  and u3.id =u2.role_id ";
   
		List<Object[]> list =entityManager.createNativeQuery(sql).getResultList();
	     return list;	
		
		
	}
	public List<Object[]> findList() {
		String sql="select aaa.aid,aaa.amount+bbb.amount,aaa.counts+bbb.counts from (select s.id aid,nvl(sum(sb.amount),0) amount ,nvl(count(sb.id),0) counts from bbin_purchase_record sb  right join subject s on s.id = sb.subject_id group by s.id )aaa, (select s.id bid,nvl(sum(r.amount),0) amount,nvl(count(r.id),0) counts from subject_purchase_record r right join subject s on s.id = r.subject_id group by s.id )bbb where aaa.aid =bbb.bid ";
		return entityManager.createNativeQuery(sql).getResultList();
	}
}
