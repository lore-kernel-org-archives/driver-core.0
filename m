Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750461;
	b=zg+5pcEWsTaidU6Ehms9Ud2s2bXctEOtGoZclS18ywiYHMfCPXdM8cYfCi/ocirAZxNK
	 jLw7pADuhk6+kM6gQnZLEa6Tz/TvgYgiuwJ/yENCJbJx9PgqVtyVxXZJO1WI7m7gVD5X+
	 crUD7oH1eE0I5UJXV5+Xrkr22i3KX/xjlVOyJYr/RXzonU38QM8lfvFH7a/aLKWYy6JBl
	 0bo53rB9VI/NhwHQ8nJBq7Z/fg3JIfq0sr/o4cMqB5cwv/IzIu21pD+IA+WwVT6DDB6oP
	 Boe5iSEMGzH+YCJHDHqF3m52luadxY4iRU/Xwdx9466MLI5z+Bv1NwAmWR5fENWV6GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=;
	b=r8Gi/uaoEoCWT24SzjCgmmPgE7O4AAvqz/EwlVd7QGdsIACPtHqzrqDyxi7o/E4Ekq2k
	 RLkinYBxlyckdFeV4JSpNuHATNDU8d1Xd+ITjajtEiHJxyLBVNPoNqV1Uuq2TI5W1e7Og
	 uIk6JWQJDEWKNMcZXz2Oawu0SXbEYC9IHO8mfh13kh4OmdaMWwt3F2Y/aBEFB4+/SiByY
	 daUDkI+mjkWHzXw4YsFA+kcVKxF/Vb9o2M+YfZjkOPX9gWfau8pc/C7XLUpnJ6+nHHeXE
	 17beEtt/KTs9i4dmyM+HWxdkotvdX3y8Jnek0nfc7o7u/1DnczjA625oLWZ1P3uXmPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJJ28prD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZML7Sbfi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6B7606A32C
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB6B7606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CJJ28prD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZML7Sbfi
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAX0E2489803
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=; b=CJJ28prDtl1Sa2a2
	Bm9KbcDV8XmVJil6iNkbtv86iosZdXfqsdZ+stkSO6KR+IETA+iLycFpoMnwm3Vz
	OqS5uLpavCrXU0lN5w1wjhl01oFAN76/lndyTFDm3iniHjSzZj54x73+XUI7nFCI
	ssTrImomR2xQNPVNX8kQqlpynOjzFr8j7pIHf8w6ybfU2ylBjb5eKI8WwYB2DKm/
	CqoPoPmLKvCtiuT5lGgIDtVCG6VH9v1yBsmahCgAHsPugfOayUdmbR6AKvxecDca
	6Wm2JKIL0YYM0/md9Px1MhlZHaHZ8de7BkGXSsWpiqkJIH9im6ntUJGNOgaIAONk
	rp6Kmw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftygactj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so138066685a.0
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 03:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750459; x=1793355259; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=;
        b=ZML7SbfiffbwmFMG0LIJq9hudDwDCwFj2gLrLqnMcoFNglHDSj4bWuebIQfOZR7vh8
         WmwZ1ex9Sn0DtfkD9UghtjexvzLAq/scp8tkvT1PZ2LlVgpbT83uC0fC+ox+5MYnYjJk
         olgQdKDLkflSeajFzh55y5vC0cy9Pmcq9NWcuDuaMMZwXTsFsgBfTY31iE43NDf2BxEI
         LT0T3vdomAhbWH8T1NUOkm/W9PkAfSGs9RKta3SRqh3RfoVwJGxdWpsL6TsjL8zDPaYp
         KmZX5Db5xdngQfGeDuwElSAjguv5eRFmN5LGEWwS4KXTjNfeT24gI0H0mIN2m82oX+fh
         gH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750459; x=1793355259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=;
        b=s+8KCd6fm4HFqupy74LmgoEaKN1z+9ucdSeTwlBaezLb2ETaPIEiWQPzZcvB3UMgtL
         mudXF1ukFEVdomES1u9h/4Db0DKgCAB8tqSRtsc3WrR6nF86YDKh3SzNo3hi7p5tOKuu
         Ir8Fujz2yhjobNJsK9PX+A0VHfpeMkaBgcW1N0WlNKdVhx6KK1kcUYnNveNJtSlmq5xb
         jOBwS6NY2yoUKBEvUEjz4MiL3KEcGqzCg2Hr9k72cw8Bp+nDL4iZwRSZaZvefNxDBh3B
         MQmuV8Pxf2bRwGFGFx763ifGnkcIEdI4RtzB4jPvCn6VTiefHXGkSfSxN0+PtcO5+d+o
         5aqw==
X-Gm-Message-State: AFq9FYJdALMUz2nLs2EfmsU5V15c2D6AwcY6t5xMJBam0f6wAojaUn3P
	ZAh9Uac7CoZgVbdq3taqGGd3kT++2xcsIkBlvRnmZZaMv3qqrKBSSt7s7g9NumOywN2hyL1Mlrt
	TuwxawsPSZ8fuR0mu/XMGRQI3ZgTB/BIRlTfcNt5WhKi0kRySjfNDVzsR7ktnncqj4w==
X-Gm-Gg: AYBFou0FYF8+GJzsplAYDc88w/72f22/JdQQRXNClNN/+Fld+4fBcQeETEpmT5RUNPj
	AyB833MmOO+a0v0t0ZeJE7vgyzn5f/5zl6HSJpt0Ihgk59bVowxFxMWzFEzCNh85cVqgnEOXr4g
	wpt9y6nJsMD6zTsIbUHarIeQMv0Qulufr6sn3aJkLMSquX5xKmtkB5MokPS4eR+EcHdTJoa3Ttf
	21j2q8LSoEC2xfs6RBvA00uhF8zD7mY95udYZ1fkaldF4oUQc0ZAuhjy1rsRehTX5YLQHVEJGX3
	js1r7MjJ8in8E6hXtGoop0Ao6ZzIcddAtLoRDCjLFiAhG6p9ArjofrvkZK0IsSv88vQ4fZYGyHn
	EfvcRQ8ra/dONs6pwdFDByeJGh2PX
X-Received: by 2002:a05:620a:2b4d:b0:93e:e111:2778 with SMTP id af79cd13be357-93f626db3bdmr810339485a.14.1792750458978;
        Fri, 23 Oct 2026 03:14:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b4d:b0:93e:e111:2778 with SMTP id af79cd13be357-93f626db3bdmr810336085a.14.1792750458529;
        Fri, 23 Oct 2026 03:14:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025da3sm4397734f8f.19.2026.10.23.03.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:14:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:14:05 +0200
Subject: [PATCH v2 3/3] software node: fix unbalanced reference counting
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
Message-Id: <20261023-swnode-dev-notify-balance-v2-3-948d920a79f6@oss.qualcomm.com>
References: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
In-Reply-To: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=b5psEhGu33J6XAeJBkiV8PWWEXQuiHu7lH/f7ufztzM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zNz2YE92ESzC392G1x8G8Br63rp3N4Iy8wYl
 osTmT9ujOyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatszcwAKCRAFnS7L/zaE
 w+tjEACZmRinXVoCkP4Z22vT7HN+sZsXAZ3M6U2IGuy5XXzSQeIY6JlnV9m0mJCkFXDahSXeiWy
 D19YDdUAXI/uoG/dR4rb8pvKJF3W0GQj7Zz6wmrGKbF//kZuPAR9BryX4tSKkY/9l5v35G2w139
 znuZpjq6K5wdLUDxX8ovhJo1rpW64PM1NktFoJ+V6NkdeZcXPtXZQ0Dlkk0XbnDPbPFkFETL3Bl
 ZI5E1562GhXyu8zfv2JqD9bFyW+76A6h/bMIjq3AeAByGOvOFMF28gV9ZSp7aqOsCSokk+/vaHe
 FF6jf08LYBRFVyVXhVVQYR7s2qPFnKXlc5h39rZBPj30HEWWDX3s8Ykxyunc+Hzd/9C/SjmZODW
 RAeSSKpGwB1nxG32AbhUPw03xXLW8911/p3kQ0YZ4wApwrH6OGPvtA6TDp0ThmQanuEfFdSHf/8
 SLvLXf1yRqs9Z/mnLuIBD7KehvSUPNDYsBaIV76RHoo/Xfn8truO40GsqoMzIUZcF8q6Eu0KQMo
 yqoG0u6jUt8nKfQ/y0vEBOKJ5iw9X8NRQ80AiYXTzEGQwwrh1N4Ke74y1bqHoe1uxOTv9KXey2D
 IgpwLgtwd2xqUoW8/0hdxpjOy3FYlqC0AGX9m2MeonHD8agNn1u7VPFE+SUXkozISCQ2ghANq3+
 VA9wzGn7riXedQA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb337b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HsDmPXzSDgUE5-xNsXYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX/GAQMH87Dk06
 p57dcoFhLaI5OEvYBhTfMktwWKzWZVEODdf4NDHRRozPP3akyBjp0tpNeAd272NJ4nMbuV26rnH
 saMoF5eJc2/pOQJKRZ7Zz0kPzRzEozQ=
X-Proofpoint-GUID: FMQ7G3k4NjG1OMp70LjiYN2NB4u2TVPw
X-Proofpoint-ORIG-GUID: FMQ7G3k4NjG1OMp70LjiYN2NB4u2TVPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXyEcOM+CbHBie
 vJnTJD0qjESv4M+2fFaZjrpRwfGW3gQhdE6AR3eYXds/23xuEPB3waVJ7ZC63RP+/TQ6csaDHil
 VyQCAY4E86V72hqOm4e3w67cc2JUOebMjUoiAKAUOrsjAtthHg3Glqm5m9uXCwP1yD0iKZitHey
 Dn/PgWriM8btMpk3YyIjy9xnBn6jvyQ+ls/ucinOOiG0HJSmr9hFltqs3zxX+a8XOAxat+Pkp8l
 pkImrrjo9WFdvqowcaP4ZoUlxr0viSOaVIh+N5FV59CmJ4Oqc2FhvGpL5P2M5BP+qruYfgZiML3
 zICrx8p4gU8+VhzqLaMlMdRooAdfKcDyqJn2UjI8cdXApODMMaxBDVjaXu1J4wQdfJ1cUe4x6sa
 IDe1oLFng5sdKw7dZ/43EzLgVNParyWYZBugqlbOLzIq4P/dMW6lc+joUmga2Yfq8aGuakyycX6
 ltPEL1qZ59EEk1+ehZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

software_node_notify() takes a reference to the device's software node.
software_node_notify_remove() drops it unconditionally. A software node
attached with set_secondary_fwnode() after the device was registered
never gets it reference count increased but it gets decreased in
software_node_notify_remove() all the same causing an underflow and a
use-after-free. Use the new device flag to mark a device that needs the
reference to its software node decreased on device_del() and do it
conditionally in software_node_notify_remove().

Cc: stable@vger.kernel.org
Fixes: 384f5a857bae ("software nodes: Split software_node_notify()")
Reported-by: Eduardo Ruiz Duarte <toorandom@gmail.com>
Closes: https://lore.kernel.org/all/20261011131518.48838-1-toorandom@gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 84a77ffa3dc4bbcca62bbe67c3390693500b01ea..9207d7f96f20f8cfaff2a4eb8915609c499cce24 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1176,6 +1176,8 @@ void software_node_notify(struct device *dev)
 		swnode->fwnode.dev = dev;
 
 	swnode_get(swnode);
+	dev_set_swnode_notified(dev);
+
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
 		return;
@@ -1206,7 +1208,8 @@ void software_node_notify_remove(struct device *dev)
 	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
 		swnode->fwnode.dev = NULL;
 
-	swnode_put(swnode);
+	if (dev_test_and_clear_swnode_notified(dev))
+		swnode_put(swnode);
 
 	if (swnode->managed) {
 		set_secondary_fwnode(dev, NULL);

-- 
2.47.3

