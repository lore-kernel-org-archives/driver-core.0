Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74A4364052
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730371; cv=none; b=o/6VTsOsPtp2kLjpss+qmr47FmiemNYE7Y2Mm2DxjmnlPGRNfTM4XU/td1m22O1aQFHbVCm5eLPR8PSOaYsmvWgNJSK3uTUGSGhbHXcQdwMW0ifEv38vUhpv60kLW4NiNl9Z/DMItCY4RIuMC46Sz0MwOAEmVvjihndYmT3OVFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730371; c=relaxed/simple;
	bh=QYS3EqsqHNnRb2qyR1WrVdwQJM+VvU5Fqh/2g07zTc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcC89uk53+44+ChH2tmKQ7Lxz6aCENGcbddOwW126aGZ9grSPcNUIbR72WBBCbhJAdaNYA2PSJIiIw5Px9CpIeXydBjj8PNcC3oQGo1V6by3vGS2KNd+YuhSuec+h0Uu92PTr0l32r+rf7hrqMMv3O8RN79WMGlE0vWgJmV9asE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqRQzctr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kp0q02xz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqRQzctr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kp0q02xz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TATEmk2647844
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=; b=lqRQzctr4Kajdav7
	lYx2um3APIHdIRxFP7EnCv74uA/yCPZPdr0IuHoKsYM4z6GlXM8rmP5DCf5eBz51
	FnA3YVGfswU8viV7u48eQGPDmipD/EGXfN1SOnvgoEz71EJrvFYS4T8/2W+JLZU1
	rxQL3Og5rGGfuBVhXx9alLxU9dN+drAPNaUj+Dljt6xQKcikodtPfv9ur5BFHJHC
	20AflN73fvRlBZQdQO9Q/bXB7z7m77eB8WKur1vUf10JSz1dL+1K4ogAtAWPIsTc
	QczPnIplWPB2r8kSI+pZ+WkBgpFdwz0hOkNKXJxNMAN+8CbhO2beSNxEaFzlBHCs
	lu9Ntw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgwsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e45453c94so357779085a.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 03:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730363; x=1783335163; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=;
        b=kp0q02xzWuXuCVHaZecyQO+khSKtg6MbXBVZwqRc6862iE0JS8t8trBy+YX3kzLNUI
         58m6WBfSeWs/NJVVW0+usKX9p/B04W+9IkgwKapUx1d9K15BLEvxgsUyCSZtJBeRyzpl
         UAQg3e5E2IPzRRLu1u0cxcWnkjCAuggR5yLqOmosh+LjIuVCInLY2Gp6rIfuZQ/rTU5i
         +lXyPy1+N3UOAVfP77UKvos1wHB2bxusuCHzVzN6t4IpUQnZ+iE09Zi6HiyHoiIUoMFo
         /gObGOu+UHT9kYe2fjWIK766MG3oOAtBNAzkdRN6BcnsSag9XH6pKckuSob4/8uo8s4O
         vbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730363; x=1783335163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=b8fuaLzKX7/zt0DI23Fv8iBITnIyykYc7tbykSQp4Cw=;
        b=Mvqp4coGHVeE7HbbvKxQkvtDGnhd+NUcrCLimdEzVYjQWB+wLJhxydIJBrFRucvJRA
         ahZAo4d9NlyccLOi/Bg8NozEHGoi7+0k2fuNjB+W2X+k69uFv1bM60RPhli6u0jUy+Tg
         HjLb2dPftvgR+hEVkROs5KeVAl//wzb7qBPjlwyAKyNjSKs9h08VqXdMj91mXw4pTc11
         ZQYzCUKC57OIZFV2bZsoNPD3JCdLqg63jB/d1cdBu7z0/0FH58L9UnFj9e2nWv7a9y3f
         wDengyXKbkpUo+ER8o87Y737e9+EG4yC7UoM4rf2n7eYbBqv7IioDG5XCtqRdIOnlIV+
         HQlw==
X-Forwarded-Encrypted: i=1; AFNElJ9LN2j2JmdpY8yRBwxjqrhwCNspsq3TzVI1jqXB9NFuic55a0bJAfgC8NL7lV/PQtJ7ZA0Eta7aDHkA8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUAI6Gzz1PjGx+v8dDcmD4HlBDqtbgBhUrCFeq0VndqQ8YyAI9
	BVyJcBiVPwqpHPm8Ch9Ymfpv9pyy45N+xtgGEeRoQ6lMRysK1oCK3iutWuP/8nWA8DinpMGjkMP
	mW4JvtfmuxS87zpdwpmE9RziRLrejyeHgyxKFzxwvtWBukRqFINdB4XekTeYw/pyEPQ==
X-Gm-Gg: AfdE7cn5GbP7HX9+XwAu8D0R12KJOrtqLWio9TH2efxI+uYIn5Cx0/4XU/uYJGCU1yu
	Wyu+2ludRXHPrk5GdOFWrwu7laedb431rriqAWYem1T2RpXDq6z9tsJb9dE8ELhiDRkAk+r1uuY
	YzanxmAKOqDyFav56h5KHIMS7y3GUosBv+JlX//MycBXqNp4HRZUURCAAdkcqZMc42yvZ1iaCWG
	zqBNkXy9KgUOwAxSCI7edrzejIK8wCLguYJ8lw2Ob0vPWzZoN7y1TbHh643jeJe9IXwgUXrkfpd
	fQNJJTzQcV/vNo6Fd0K9GkAzyZhjOiRIfl6i3SrkAscbk1om0EiQMyr6zpA+wuq1QjLh+TLt25S
	Ywq8cevDoIyAKmcTTOhM4V0NPSX4YZv7p4gM37N7w
X-Received: by 2002:a05:620a:7119:b0:92b:6805:9189 with SMTP id af79cd13be357-92b68059702mr1417912685a.65.1782730362655;
        Mon, 29 Jun 2026 03:52:42 -0700 (PDT)
X-Received: by 2002:a05:620a:7119:b0:92b:6805:9189 with SMTP id af79cd13be357-92b68059702mr1417906985a.65.1782730362062;
        Mon, 29 Jun 2026 03:52:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:09 +0200
Subject: [PATCH 4/5] MAINTAINERS: add myself as reviewer of software node
 support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-4-b90058b41839@oss.qualcomm.com>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
In-Reply-To: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=971;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QYS3EqsqHNnRb2qyR1WrVdwQJM+VvU5Fqh/2g07zTc4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5vAtDrLBxJ7wJSt3inQfdwNmzPhUgJvSVzf
 KKilDv7TSaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObwAKCRAFnS7L/zaE
 w0uND/45JdiqnKMuc5wUZ7a94clqHgiv92Vw4uq+Dt6H2vT1hShus81oLf7Az0Mn1+ZcdzO5inx
 eNYRIp8fz2ZpoT/6th+odyzuaJmtXtCX9sUQefkbocFl5tiYsgqMSRh7H8IYamQSvGNDM/wLcRl
 XSiMXhYxCf5B9qprngFNBNDx906crWvX0RxaHngioNcf2iXtpnumvKq1JacaM73djmyYrQOJg2u
 Vzd17L1sffP1Uf6+nhhVWDoyuAASM37vzZC5UMYr3+K2o1cjKECYdNfh8SVC1opRBjYLtgcNA6q
 QIR0awIpCX8jjCCsrMFOOMjPhW11xf5rXIQZnqYD4PMzhZ4zEjKCXT8DwVAKvzQNlaW931kQYCI
 bpeaTs2sW0Y+XAc6and8RyHWbCV/EII+gxghO2/OJJzZct+Ms8OEvN4kECINn8jkKB8ujR9Uwf5
 QwIrOrYACLqduoHLLAwoAPGuzjZiq4fSN0p4dS/6rU2CEtgtEWzoU9wk80VW7ORKXQj4beGR+qm
 fZfGoZVLk7A2YYK4f0IfUWDEyLVSaQyMF6YDJvEAyrWEggL+2h5q1kJxeOzwOtF5HF0kGtSvgwj
 nldxL4bakgFDh4R5P9SRskUl5GvrRvUF3ZZivjIctlqsVNwF2zj7P/iFX0jPKUCgkwB/LdHLvPn
 sKj75IPRiSn3IDg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: lKELE-CjciaYZ6IomW1kXaIgPzwiOXM3
X-Proofpoint-ORIG-GUID: lKELE-CjciaYZ6IomW1kXaIgPzwiOXM3
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a424e7b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=hdCJvu6vi-O6ykQZt0QA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX9WyhCZ6R4dt4
 zI/r9E9urVu9x6lTDH50++l8Ag6y+5NT+Ec5EFlpfX0KElSaFx7jWxuYULFMkn0Ws1I5rUuUEbu
 5zLG6pw1qIPvCqrnuKpdFnVc0bjcXE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX5xI9HgwL/VQf
 E00Lx21p/lr4WZQLepZZqVby1ZuihKSRTfCtY+JcIIFCH6CcH8h03t4YGA0fcZUi/xpGBqp/x5b
 smgZgm6cf6FgI19L1mhsAqAq6oRLNHiLt2P4FWHg+r7EDj7sZYk4J52orlVcRgUl04CGAokCJKW
 aFkPqgz2x6V0XHJE8UoFBRXbL4NF/6kC+dvXzv3tvIVd7ynZrI60Z5PUtOx4K9ikq1PNjA1nlxQ
 Y3EUG/xeT7NvR3SwEzBmrYKLWDG1RfIZ6HBScKbo+DCYV2p4+4GGuR9UStWbkAoZYEfrlifPPWY
 jeyfrccPoTBu4SaGDaftugzN8Xx1ffSg73wda0RBzyV1ggpW97sqqjcnY4T89+mn9lD/SX5NJPL
 1VaFzW88oWVkabV/2oNzCSoKe5L3CGrk2afV+fQN2HnNZ6xv1znnHDwQIyC1Fqsj2KkkVp0psaj
 7R2x2qj3leX0Me6o87A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a994cf1b354f490d6c4e411588df88..e30aa3b63eff90bc0ccc39de774986ce17494071 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25101,10 +25101,12 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c
 F:	drivers/base/swnode.c
+F:	drivers/base/test/swnode-devlink-test.c
 F:	include/linux/fwnode.h
 F:	include/linux/property.h
 

-- 
2.47.3

