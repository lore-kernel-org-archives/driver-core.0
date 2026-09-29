Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDCC515987
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681916; cv=none; b=NHLQH1FGrR3q/Mu7w4vXUDKh619170uCL98JkF2SXYH8jVR5zg1NB/d/F/Wx5n9aqTVRocVX7zcGE/cgsVeKqvYx9Dbv09i+J7O5a9zHYPzzYOgkG+NJs24wuSIxhFkLwDccKGcV43estkSwWyqJcEqbP8j8NqCR57WR5w15AZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681916; c=relaxed/simple;
	bh=7JDEwZlYg8XjCuVnYsnKF2kSPqk9OomdJ+3Kd/nIeBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K5nN+j5HZBtHAtqHmm43Nodb8VyFnXSc+Jjg3716EYEyz2dcZcPo1UyX/Y/WrRTw8uQakNarElv9T2CONSBISB4s92YrzvYr7VxCCLgqx4gsELxJfprrkpM/uhbC3NzaEu+z1c9UfKdXVADnoFAGmna3O6e3KP3svx3RiJn7A2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAWsyXEb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=akrp4czs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAWsyXEb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="akrp4czs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj5RS335130
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5nbPD22Jbh6I0nCcqKz0VI
	PeO0cIL1IMQ0/m7y2jQ90=; b=hAWsyXEb7RIpElqN22JRYzn5Nod22BZ5uprMAD
	SPXUarnmTjFdY7qHs1aaTPic7Eysv9CsE+WnfG9h29Yi07wDFt7X0aEoPi7nfK18
	kjXSuuqcjbF/gTjFOINbWd9N6PWtgAuYFmX5D0B1SPCvNA9RqkAfMg18Oi7DLrJ1
	AE6GRM8IdpImSFbYWYwEZ6i92WuGBFUKhgtyxw2ZbZ43pJLqKpe1N7pkca/VXzt5
	JHuLo1SExDnPZieqD++XPwh0e2b2hjDd523Lnrej8Y4dnaSoD5y8gVyCwt8Rj5rr
	13/BClru+cJLFhn7E7ztRvkzdrY/5kb/2/wTVs9c3x0+8tVg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew27e9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so2832692eec.0
        for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 04:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790681912; x=1791286712; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5nbPD22Jbh6I0nCcqKz0VIPeO0cIL1IMQ0/m7y2jQ90=;
        b=akrp4czskUsSIomfccls12lEA+vdrEiNVVd7TRAkti1YnEIj5aEY7+5UPxnRjVgjwm
         LUBG+DiMcf9HvsZC6RvzyVPpy7V/Z1dwCO0+Fvpqol/AyCYPzyGim89pRjEXsgc61cu+
         fXPHL9EhmMLP1yDaufV3tESUhaosV0b1kCYycU2ybgBQpBki6djjHAw129avMUgHGCzf
         bv2qqyUxGb6QQ9IUEmuf663w2wxHJsJuxVB2Juys7crf1aw95/9hZMslIBtXnmIuGSKC
         qHjr7FBh2Oj7OAe0ccf+zmQKjV4l3KbJkrmYRsBkxWxLO4IqIzMbJbJFFEprfT7ax5kn
         APeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681912; x=1791286712;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5nbPD22Jbh6I0nCcqKz0VIPeO0cIL1IMQ0/m7y2jQ90=;
        b=uJHof+3U6Pt8ySkOXSALbzht2tYp/EySWB2Ov3hDQk4HDC+UID6ZP0HjhPxoU/iroA
         9By4x1fMiePS8g+2kFqYTCI9dARHcC3ryMQpYv+dwBnHKRxmjcYRYKaxebgUfZL+918u
         GmGfkinwMdCmVB5Ep45h9pJxJNVjS4vSA8HB2QvrdMUEdvj6IgHBkXZ2sjLla10fVGN0
         4ABtISnURBQYVJM+W46XiQyPpcp3BUJUcNpAE7G8O4HMIRfJOoW0Y5PuO4cnKDz37yxQ
         3ID7YmSrIbPNJjpZajaJHW+/dsm6IOAcdtRvubkfd+H+XmlWchWQ5dSNq0zS6W8vDNto
         kVEw==
X-Forwarded-Encrypted: i=1; AKwUvBwog7sgl1Kx8BiLa+Fgy5j9cqZsaEFhYx7kwHSJX44v0b4lk4+Zlm3xAf+VthL+m5wAq+HUTvYUABG9yA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIG6bozcPE0r/17FWk6G3sG5TdHYxI1fRwIm7ezdWuCQWazS5Ls
	uCSqKX5QN7nZcmCuxmx/b9BnfsN4he6pu4ZcCnN/SvzuoruFMnAV7zn7Us1DdqwfQqM9ncg1zfN
	uGDn3GLUYzPeSnYpIJJMpgHgbaeMKdxRnnhOgtPSTVRSItt896J6XafDwrGHSopSS8A==
X-Gm-Gg: AYBFou2r+dw47AevhxoKJzlEnypUMoCttXiWJEescZAMBBUWkro1dt5QNJS2o9ZThmx
	MpfO2o3B9kHsnTYKEW/c/zy4/2ARd8bHAx4i00pMhX1zdQeMhHHweA5QnHo1TrmETTBc8cye4dB
	LL/pJSFee+JmCLVPO7j2ZTt74HTDI3MehyQU5G1rFSH9Oy0NeNqrtrql15ADZOTSMe/wQNDb77W
	EnFyMaHxHkiDnUPigNAGjP/nmoTcPHVZIw9AYcu3Jwmk2c10wb8r9Yyx56bgdUuG3rB7oYsZFAG
	Xn5dwBKdB8sJ5/RDj+50iMQfzj0p+eWVgFGJ6aAxldESLey5dPxlOJ0cMKvDfUDTv82DzCdYAtP
	Nl4/lnPSlgxrows2IvKxRYTLHvfFmh7DA14/H5KUTPzDr7YY96A1WIRr2vwblPpmFZ5tto8yM/4
	ag7cTUHwrDcl0R3/Y=
X-Received: by 2002:a05:7301:5804:b0:33b:e3c8:a757 with SMTP id 5a478bee46e88-342705b865cmr19524584eec.1.1790681912105;
        Tue, 29 Sep 2026 04:38:32 -0700 (PDT)
X-Received: by 2002:a05:7301:5804:b0:33b:e3c8:a757 with SMTP id 5a478bee46e88-342705b865cmr19524547eec.1.1790681911529;
        Tue, 29 Sep 2026 04:38:31 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm37145604eec.25.2026.09.29.04.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:38:31 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Subject: [PATCH v3 0/2] sched/cpufreq: fix schedutil's boost frequency
 handling
Date: Tue, 29 Sep 2026 17:08:05 +0530
Message-Id: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB2ju2oC/42OQQ6DIBBFr2JYF4NoFbvqPRoXiKPSKFRGTI3x7
 kW9QDeTvOTlv9kIgtOA5BFtxMGiUVsTIL1FRPXSdEB1E5hwxnMmWEZR9dD4WQ+0thZn2jqYPBi
 10qA3gzYdFZDXLU9FITNJwtDHQau/Z+RVXYy+foOaj+XD6DXO1q3nFws/vCtYMvFPcOGUUX5PE
 y6LJM3L8mkR48nLQdlxjMMh1b7vP21FiVftAAAA
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790681906; l=4900;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=7JDEwZlYg8XjCuVnYsnKF2kSPqk9OomdJ+3Kd/nIeBs=;
 b=t1huhPnVrum/f6kWecQp5ubUmg+2ETdQrzjbk1l74PU461Nh7oOH1ZX/W4MXjJVbQX7WcX+KF
 2y1r9w7PiS4CO6QlogUUc3sdXfohdqdQkSY89t/uL89eDeO+xYMk1f2
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfXyq1WHzrrG/JB
 XqdQR8yzgl/mMsvClS5TloqQ7DB4xWL7lFvb4b3VUJ15l73H8qepChma4szguVIJnbQrssTmYrw
 GxbC9si4MSRnjUg+wjojKWRfLpS/wHY=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abba339 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=ag1SF4gXAAAA:8
 a=BTeA3XvPAAAA:8 a=7CQSdrXTAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=qyfCnS17RIpad1FwrgoA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
 a=cvBusfyB2V15izCimMoJ:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=tafbbOV3vt1XuEhzTjGK:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX/QxqQuoFlOly
 7DKUh9DH7u4MHg7i028s29TABWvSr1s9b2ZwbkDwDCuqZZTgIn8ZiHx4R17RE2InSNXkpB9ayuj
 sHgiM9cBDoit9vG7ckBUAZcY59vjSJDcYhiCjdbdfshfUQiV6ANhVyoztseZCek0BhO7UmtG9MC
 HNcXiWv1e3Eq/sfhOQrBd21/S17/b8gVKmt8KjWTQ+CGj475InLX3pAdhr0qHL8blNPV/0zYQIV
 E4uYRxxSTcikfjlRWnXyxUq1pQs9VFVpxyLz7FtIR6nWXLL87a0QlCfk8V5piEzOl33szX8wuf6
 oFGOjFEt6SK6NcLi1ksb9LCmHb9kISSO8tf7vhQEENi7a2zlbp6y5svV9Sx6luFkpkHv8Y47GW9
 Sv7myk/C7EJ88rliRinVt9gey0NjlBDk3FAi5HwqpAVA4Xc4ipsVFzUHeXAOXKFuJLjQWcWrSEw
 4JevHKl0AAx249g9f4A==
X-Proofpoint-GUID: mUNE4-IVHfCn-ppfho2amNt9MDEzFbGB
X-Proofpoint-ORIG-GUID: mUNE4-IVHfCn-ppfho2amNt9MDEzFbGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290046

Schedutil's ability to reach boost frequencies depends on two values
being correct: policy max, which caps the resolved target frequency,
and the per-CPU capacity frequency reference, which anchors the
utilization-to-frequency mapping.

This series fixes a few gaps in how these values are maintained across
boost transitions:

The per-CPU capacity frequency reference is set once at policy
creation and never updated when boost is enabled afterwards, leaving
schedutil unable to target boost frequencies even at full utilization.
Introduce a helper cpufreq_frequency_table_max tp retrieve the highest
value listed in the frequency table and use the higher of it and cpuinfo
max_freq to seed capacity freq ref, letting it know the highest available
frequency from policy creation.

The generic boost callback only raises cpuinfo max, never lowers it.
Once boost is enabled, disabling it leaves cpuinfo max pinned at the
boost ceiling, keeping policy max stuck there too. Track the max
available non-boost frequency and use this in conjunction with the the
highest frequency retrieved from the table with cpufreq_frequency_table_max
to control boost frequencies when boost  frequenies are available, allowing
the frequency to drop back to non boost values on boost disable. In
the absence of boost frequencies, the handling will fall back to using
cpuinfo->max_freq, preserving the current behaviour.

Oleg Keri tested the v2 on Lenovo Yoga Slim 7x Gen 11 and provided Tested-by,
but it is not picked up because of the implementation changes in v3.

Logs below for clear context:
Intermediate values from the time_in_state output and logs from bench
runs are truncated for brevity.

Before fix
----------
\# cd /sys/devices/system/cpu/cpufreq/
\# ls
boost  policy0  policy12  policy6
\# cat boost 
0
\# cat policy6/scaling_max_freq 
4454400
\# echo 1 > boost
\# cat policy6/scaling_max_freq 
4723200
\# echo 0 > boost
\# cat policy6/scaling_max_freq
4723200

\# echo 1 > boost
\# cat policy6/stats/time_in_state 
355200 36958
4454400 650
4588800 0
4723200 0
\# 

After fix
---------
\# cd /sys/devices/system/cpu/cpufreq/
\# ls
boost  policy0  policy12  policy6
\# cat boost 
0
\# cat policy6/scaling_max_freq 
4454400
\# echo 1 > boost 
\# cat policy6/scaling_max_freq 
4723200
\# echo 0 > policy6/boost 
\# cat policy6/scaling_max_freq 
4454400

\# cat policy6/boost 
0
\# cat policy6/stats/time_in_state 
355200 40147
4454400 79
4588800 0
4723200 0
\# echo 1 > policy6/boost 
\# cat policy6/stats/time_in_state 
355200 44834
4454400 93
4588800 25
4723200 569

To: Vincent Guittot <vincent.guittot@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rafael J. Wysocki <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
To: Jie Zhan <zhanjie9@hisilicon.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: linux-pm@vger.kernel.org
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Cc: Oleg Keri <okerixx@gmail.com>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>

Changes in v3:
  - dropped max_table_freq field and added cpuinfo_frequency_table_max function to retrieve max
    available freq instead
  - changed the condition in policy_st_boost for not relying in cpuinfo max_freq to be whether
    boost frequencies are available, instead of whether a freq table is present.
  - changed fixes tag for second patch to Fixes: db80ad776cd2 ("cpufreq: Remove driver default
    policy->min/max init") - thanks to Zhongqiu Han for the checks and suggestions
  - Link to v2: https://lore.kernel.org/r/20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com

Changes in v2:
  - introduced max_table_freq/max_base_freq fields in cpufreq policy struct to use for seeding
    capacity freq ref and handle frequency switching during boost cycling.
  - does not try to update get_next_freq or drop the one way guard in cpufreq_frequency_table_cpuinfo
    anymore
  - Link to v1: https://lore.kernel.org/all/20260806044230.909961-1-sibi.sankar@oss.qualcomm.com/

---
Ananthu C V (2):
      arch_topology: seed capacity_freq_ref with highest available frequency
      cpufreq: fix policy max not returning to non-boost freq on boost disable

 drivers/base/arch_topology.c |  3 ++-
 drivers/cpufreq/cpufreq.c    | 16 +++++++++++++++-
 drivers/cpufreq/freq_table.c |  9 ++++++++-
 include/linux/cpufreq.h      | 16 ++++++++++++++++
 4 files changed, 41 insertions(+), 3 deletions(-)
---
base-commit: a8c591ed6b672915e0be57843f943a2a723aff40
change-id: 20260804-schedutil-boost-frequency-handling-8e6bf2387a4a

Best regards,
-- 
Ananthu C V <ananthu.cv@oss.qualcomm.com>

