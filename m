Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795085847;
	b=ywiPD+1qfTTOrQPMM8QNrkv6LJ/PNqXWkaW7Y/gjcX8k6uphuIfjghjCCPu40yk5U7dG
	 hOibTQ8CAoSdynJ1+Sxr0nIlWqVbdnbrgdB+8RjWg66Fg7tQJXKTF7yZq85ASH/kwMoMZ
	 6T/cdLIC91OsZE6B0jfPnod5nAF9JnE+Njcyx/7ADzpAPOh+ExtFP/3QSzoCfgLjP/OQy
	 a+cRZPJ77PG2vI3Rtbq9OebHgSj7oii3f2+QHmPpiFxBMHpwOkVATBgJryOwK2KISiL9m
	 vkgaRKkxSMO/w/HeBLyCv3CjD2kQpgq08jTS8ltnoCxR8hG2oQyFVTuKeqJK/ODQnqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795085847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JFsoS6ri2XuI0W7ZaUYiJaCSvYPtS8y6PfumWrPYH1U=;
	b=QpzvjbL6zNqLoxDa27lXNtIWH4t33EkxBfo1cBf35aHbl2EEun1blO3NeP8ii8HugE7A
	 B8R2ny3aqP+uFHPYstL8kvYPJ+djZu8DdAl4LnOAlEH5FQDEXaKe9KxAz7iXTfEBLGKnC
	 qAFh9rlB739oomfgMSLuoNonLdbAczFVzrQDYHkYt+BwlYoDLG8H9eU38PTCFgFaKav0H
	 jwBDWxmN+yHlJmm/s7UtkekMp/Usjyk0kNI4qtA+EsnveYXHpShGok75LVG00YwFR2sF5
	 75AEodiC35UE0QzrWieRyk+sIiwzR5BTIywxQvY1A+hraxRJm5qE9dEV3I8F9lS0SKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3LbohtG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tv9+JoHR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71207606A320
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 10:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71207606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O3LbohtG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tv9+JoHR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJAuigE2736653
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 10:57:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JFsoS6ri2XuI0W7ZaUYiJa
	CSvYPtS8y6PfumWrPYH1U=; b=O3LbohtG906Q1T6XY5bwTkoSh4SJNCJGUfJg4j
	Ois3DCtMUnTLp/e1+H6CBP39fWS0L537A3X2vR+B5Yx0VSaMl1vHzL5GCen8OoBE
	XnRtuqY9LKrXC8S9PiqwiXxhph6Fpu6wov2t7ZxFTcwgODG8Ybz+qQuVxc4K4eH0
	W2dg9v3OFNF5UtbjF5wia71rk4q/MeI5Zqd1b69rvqBK51Oe5NUKQ/Ro7Y1DINj2
	mrV6yNb/WWXfmPDuErOroLipl3K1Bb4V2T8gonem1yKKRTzgdnxn9F2NVVzqfOOl
	Z56Thi9rveYngsZwKdzCnvW8/Y35Dk/5+0cfPA0eZnjaMGQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6rddv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 10:57:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55cc3c32e15so23762991cf.1
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 02:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795085845; x=1795690645; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JFsoS6ri2XuI0W7ZaUYiJaCSvYPtS8y6PfumWrPYH1U=;
        b=Tv9+JoHRHJ3urnVOAJtERzqP2DgklXvR96kznBvVaQIFqqBsXDtPKJZqvkHKmYRtlo
         zxjvoa2URQdt89PGok4KtwpnTaLGbiHX+rAu+WQ0d2EXhu+d6JvGiT/4WCT4ldQ9Rbs4
         TbmO+3L3+vZwx7U7qAS+CDMrLY4opSty0Wcp7m9GQo1TuPnVNyXvyhnTZos9VfA/8iTm
         GMTx6oIZn8BZiKq7Jjaos7e1CN1KqLIjWW7qwRtgCPBRT61e+9qMvhzlAJyyBnJSxf3i
         TIlKsnxxBBHcaMdbcHY2estEY5eFlrbE2I7y0VsJzpbBa1mR3o4Qo7POKO4AanQFGNca
         kGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795085845; x=1795690645;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JFsoS6ri2XuI0W7ZaUYiJaCSvYPtS8y6PfumWrPYH1U=;
        b=S/6Lwm0nU31hiLDgdaCK3WgVw3tXJsS6b5y74Fs4MDhZWSzk6fEHFMO8hW+qt/117o
         JoQzoXDeFH7wCn4tInW+yJRqQez+HhnvwdP7Y5me21MM4/gpmNxrp/OelaFtLYXWUhKJ
         n9Fq3TzP4eiMclKNTH1q15o295/gmjkajqivlI2gXFwLqAaNjxeIgyRt2GtoqxePT5sc
         oSfEADezgAJs/DZwWVpmUpDJTvrxV/I6vwiQ+ahlGGijeKa4fPyl04Aumy097H2HJvRj
         6IjvxjdQjAx93lc4Sss2rpmUmGXgdmYGqHQBisHrNPcyJJllpxSLMukz1B35/jMfzjyM
         NPcw==
X-Forwarded-Encrypted: i=1; AL+hErHPAPyoDaNVfV3sRRQfE3C2OoO7tipK2d8sQqzU0E8AitXTe6J8G3GN8lsMjn8KkamrYTavp9Ul9DJTUg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8bCDaL82ZeitfCILQwgor917Du/FNkwHZ/wTT2mrFHFZ7zSAc1
	yi7IjpLjonnXZELVcZDysMXhZctu/ayjxYkUa9ivCjBr6s0fxU89Hfp+HMkdpdNxeQzhdJHlQng
	1By/gJKJqMPP2ycOZeCoVVMPrmaCeP2BR2ke3kzwiJVz0cRovDYfPvdT8mxYxEZAF7A==
X-Gm-Gg: AYBFou3Lc3e8Ir4FR6fOHKoCjN/pJSw5YMMapXqBMWiaHTO+YzCWp8Sdiq7z9Ve/MXO
	2PWwEq407liDTsA2mONUvl0LyHikASyqtJWRm6x98bAaDXim3Dn8Q8dx2+kvkAsVN1WLnCsCCC2
	urpT0V0yyXk6kVTdLs5ZSzFALRp9OWx8ah2QNAomVEYHTDMSZ+mukD/Z1txPfT5WRL4+p1ofdWU
	54wacTu2zO5h993ypef27R274CvwPyEGWAPSO7gYwSqojDxtmgKsSUHn3c3enPHHChj1RkmqG6h
	Z4GQDRlnUuGbtG0PT+aOrEBGu4iKVF7SciTzEU3zD7kCiWvtitzLrhBGatB2eXILwu2TrwKJmu2
	bGEcKTPy8ubEBKOESMvnYo3KednVkKSZV7fL5ozDiyeUKIzLSlvSwoVHXvOsVA67bnXImJbNrNH
	s=
X-Received: by 2002:a05:622a:5807:b0:55d:333a:9c52 with SMTP id d75a77b69052e-55d5a2b12a5mr80194461cf.11.1795085845293;
        Thu, 19 Nov 2026 02:57:25 -0800 (PST)
X-Received: by 2002:a05:622a:5807:b0:55d:333a:9c52 with SMTP id d75a77b69052e-55d5a2b12a5mr80194191cf.11.1795085844584;
        Thu, 19 Nov 2026 02:57:24 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb84e4df2bsm26665535e9.3.2026.11.19.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 02:57:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:57:19 +0100
Subject: [PATCH v2] software node: make swnodes hold their own references
 on parents
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-swnode-kobject-parent-ref-v2-1-7ff8bd54e526@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAA7W/moC/42NQQ6CMBBFr0Jm7RBaIg2uvIdh0dJRqtJip6KGc
 HcrJ3Dzk/eT//4CTNERw6FYINLs2AWfQe4K6AftL4TOZgZZyUaIqkF++WAJb8FcqU846Ug+YaQ
 z1sa2pjVqr8lA3k+5dO/NfeoyD45TiJ/taha/9h/rLFCgUtZYJUVtbXUMzOXjqe99GMcyB3Tru
 n4B1Ax5mckAAAA=
X-Change-ID: 20261106-swnode-kobject-parent-ref-3bd9b9b75aeb
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2423;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wZe7rBsEI4ji+EJjGj+EZVL4FRQLMyYUnyMYDZz0BmM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq/tYRI3vkUlqOQ1k9CeKdLjYjbWcHJvtmK3x96
 OyNwDhzW3qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCav7WEQAKCRAFnS7L/zaE
 w/2DD/99v6wV46jHPGJgxjVou9/QkG40Ryp+Fb8aKw6uG0dqNm4gzwPlZWqMN6idOAdQM+xCPhG
 gQEZK6cJs6YnEwSZbU574yuNIfD2Tgk4u9l4H0gO2tipG8oDvL0O6TpEs+hE2R3GmkjBH/Fe9mE
 +Rcegf+zqhuk3YJGO81VVfP0h76Xm6nmgZH5lx50gG5pcT9FDz5gTpXI01gd4BS/6CJEBBiJqZK
 fF0MvkWMumQVtvGhedfUDyAd2u5hBQfI2xHGkl/dvAfgN4XMTVWKvlA/1fBe/liebDOJvjM8Zsw
 r2hq6T25qCi9gIOi+lQSMv3/5hi5Dm9SerI37ptoqEfCMRfSkVXrZLSbOF1vBxISVWiplY1Wq7H
 thZHPBOqnEA5tw9gA3640PyZj9Jw2co/DMUlHojp4z6vSUVjW5sT7FzTWtQjCQYWaIQBqb4Me+t
 5002OP5sfpW6kipcIN/KbWtEfZdGeY3QsT04UDWGjOqbzLecw3b8/NhpO2xCH921HvyugFLtdcz
 qArcj0bW0mYP3t4mFxNMTYQBsFvPI2oxfbwDsJa6eLq+GiFnhyUMIIlU+r0wxDRi1FSdU3uijhS
 kVeV8RyVnEGVTTQ3V2/plyI6XNzBJYDHm0iKSZPq+NqwQz2NPyMSOdBylO5BxFwbcY6mhqahLNY
 ZDdWkt0kor9Oncw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6afed616 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=c92rfblmAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=gm3xcvSgROcOYQEXUbwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0MyBTYWx0ZWRfX+pgOQxwRtlx+
 vibrE/LqpHaqLpjNX5UAaEzUCPIZO9ef6BDgkpw0fKw6Rh5kkxKXWvjXOC52sRpAQeMcIo1Os7J
 lHwiKVhT0eKZJoL3ONMGeCoRKHANEpBDLgN3240rvcE0krPwTuuTlmCALW4DOA7pc1RWO1Dtsiq
 0bGn2TCv/E+10FUE7FD36k7GMzlDbmdn3OwaIOqyVOK5JPlFwCpxG2AhxlwVOqPtRi45VR5GqXL
 aMUIe+ZROhrSgqkMU4GLVR8V4k/Tesr0aAXjBwntcAuVCf87MuhpFgx7/GRl7pKLHY2a/xrzVL0
 sBqkHMJbDNo82E5HbK8tmkK8PN31Ol3ywCNV9Wp/nhQolbF/mPzqCEvxRlPuUbtEdKsNSjNmcCk
 jsMAlxH5UFumJwnvZtZ0DzsYCiZwfZmhYBvrnkQzrMJ5SMLIFJngpv7asxoQpgqhupjqx5Pp8br
 vT91sOJWVZ2uPSzDjsg==
X-Proofpoint-ORIG-GUID: FlSUsrcgx-zZJ9LZEzIX9vVlDPvsoaJQ
X-Proofpoint-GUID: FlSUsrcgx-zZJ9LZEzIX9vVlDPvsoaJQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0MyBTYWx0ZWRfX7rFHVJ+KXRA8
 RYaTiEOa4FmD41iwkdOm35FYmjhTvy2eLr22xUUneCvHPsVOGBHnQcMUQKunvTRSZytU5aqdH+H
 pPh8WF5y1HTo5W+t5XZt+AH/vh9ZiGE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190043

In swnode_register(), swnode->parent is assigned before calling
kobject_init_and_add(), which normally acquires a reference on
parent->kobj via kobject_add_internal() that is held until after
software_node_release() completes. However, if kobject_init_and_add()
fails before acquiring the parent reference or drops it on error in
kobject_add_internal(), swnode->kobj holds no reference on parent->kobj
while swnode->parent remains set.

With CONFIG_DEBUG_KOBJECT_RELEASE enabled, the random delay in
kobject_delayed_cleanup() may create a situation where - when
unregistering the child node and then the parent - the parent object
gets released before the child who's left with a dangling pointer.

Acquire a refernce to the parent swnode when registering the child and
drop it on child's release.

Cc: stable@vger.kernel.org
Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
Closes: https://sashiko.dev/#/bug/linux-82933c14-d212-49f1-bd2f-d4ab1e16fed7
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Simplify the code by folding the swnode_put() call into the existing
  conditional branch
- Link to v1: https://patch.msgid.link/20261106-swnode-kobject-parent-ref-v1-1-77dbd7213dd0@oss.qualcomm.com
---
 drivers/base/swnode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 65e9388af8651f9d9602ff82e1761e5870284f26..f7b53e966b183cec1bfba6535ccdba308b0be68e 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -850,6 +850,7 @@ static void software_node_release(struct kobject *kobj)
 	if (swnode->parent) {
 		ida_free(&swnode->parent->child_ids, swnode->id);
 		list_del(&swnode->entry);
+		swnode_put(swnode->parent);
 	} else {
 		ida_free(&swnode_root_ids, swnode->id);
 	}
@@ -886,7 +887,7 @@ swnode_register(const struct software_node *node, struct swnode *parent,
 
 	swnode->id = ret;
 	swnode->node = node;
-	swnode->parent = parent;
+	swnode->parent = parent ? swnode_get(parent) : NULL;
 	swnode->kobj.kset = swnode_kset;
 	fwnode_init(&swnode->fwnode, &software_node_ops);
 

---
base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
change-id: 20261106-swnode-kobject-parent-ref-3bd9b9b75aeb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

