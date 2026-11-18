Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019821;
	b=gOpF2bcUHq7o0bNyCZ7/H6qF2770bfoluQmKN1kv1rE+ZzZGWCP3Rs42TJEtGxx4zNDt
	 1yJzbt6zcl8nJYFcRaxM19JJktZlUP8tiSg3ExIrTXAvuZyBlE7eI3qNV4/VVT+D2BHAa
	 vHZ4Pzn4UYI6CFpFP4Hw/Po/OxxCIhG5dIrXoqbDeUzH0QraAZcIooaMQoowUWUNdPgPa
	 VU1Mfa+EuGz338ImD449GZtuDfcGsq85UxNAjQvBe7SAPClb0QnBzhj3QxxLiaWqgQWae
	 WU82A59RHEy35td+fAYqSqgxilEoewF2wBivdvkq9PlPMIjGEVWkYaDyAs2Wm42YEIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019821;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-TM-AS-GCONF:X-Proofpoint-Reinject:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TmmYz49EZYskwqE2evp0C5eWLTGphEa9ppDYNdOJLXI=;
	b=BExvwKV5gO9Xkm5dpHvgCoBhNYAehguCnC3W1JMCD+z8LgdhCZBd6h+Bp7bnZ+P2nV4m
	 YGynFJ0zFsn/DyDJPGmkOcfBoxpBBotcUY0oP15u0ILa4d8wuK8hRPbW7L6/v0zWgSY/R
	 cRnWIsvZOb2NTIvCP515ju/kC7mKmPtVvKbZjEsVvlRLmxFNGogN41GBGwIkGqsM947aW
	 Ze40Gi6zhYCi1OooA3PKvOCsPhWYA/1wL4efl0fPWBpROlusDx8FYZ9BDOWlUpM0290zU
	 Bv74Okgd5Z3Fi1OUOdULkfWBtop+P0spKxpXAdHQCFH+39qZYasNLZddDvSuZVqIPWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZiOIRg+Z;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A669B60A2607
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 16:37:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A669B60A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZiOIRg+Z
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQBHE1373026;
	Wed, 18 Nov 2026 16:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=TmmYz49EZYskwqE2evp0C5eWLTGphEa9ppDYNdOJL
	XI=; b=ZiOIRg+ZJsiPTpDzqzLVlKc58MLHpAFj2+0GQtRm8uI+7TNdWT5BZaDNF
	bSiVuiFWbaBFNcjOWqSs8ohjp5Khql/bo5wdLOSIUF8BEvsaaWvG1IgskKFssI4M
	4QOFtDLOiOv7SJmKzpRGM4sFZFB3mh2ZZsjKYlh5Ipp1ydB4OcXX73+uSDsrD729
	cbjWNoaOPSNHUmJXdi8tsLKJaFUC5vEhnCv9fY4FrVzk7loXNddN5BKj+SNkfYZu
	MXcsCjJnGdiP4ZbmSaTNACqKkiKzHM7ecrM6RC8UoiFjeYVgogDAQJOrZ07miOaM
	5CUOl4yAm3LJ9cth9Hdw5afngDaAw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105nbef8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 16:36:52 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDZGCC3180338;
	Wed, 18 Nov 2026 16:36:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j02jugw5m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 16:36:51 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AIGalL341222648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2026 16:36:47 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 99F742005A;
	Wed, 18 Nov 2026 16:36:47 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C647A20040;
	Wed, 18 Nov 2026 16:36:42 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.19.105])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Nov 2026 16:36:42 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, sudeep.holla@kernel.org, ritesh.list@gmail.com,
        tim.c.chen@linux.intel.com, yu.c.chen@intel.com
Subject: [PATCH 0/5] cacheinfo, powerpc: Move powerpc to generic cacheinfo
Date: Wed, 18 Nov 2026 22:06:34 +0530
Message-ID: <20261118163639.890546-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfXxTZLB/nkfKdu
 9ahc/7cym+FTt5RSBrwRmJXIXqkmv51RthaStlHFtD6cZA9eSezGO4m97Yzg/dBMBzFYmP9M3+Y
 44zrMrKcNByhN5rk0AgJ7aWWys+DDfNj5t1S1Hej626ZjLpP9Ac/qX4XRVSrYqrcaXhqKuPsIrp
 d3xs3faJ68HGbwU8zVhVBWLvEdr4ccGufRPnbi7ktGOHfWc0M8cx+bCQ2qQCHJRLX2zAnFaj3mM
 aIkHtsqca7jIsL96wqkotJQ6QvhmTNCXv/Zd59+9Cz3yCjO7PdXw2dZktWGytcFOoC0kCnVTXnD
 GP68CecHsDx8M/B2+A80ZX/+C2UQ0iSaUqp9FizLs2/0vPg6UkDZrbzM7Gs16e/2BRT3Ou3LG2j
 AtVlD3dp1J3pLQEgch4hOjFMTMOEljNeMbjUci+I3P6hJSG/tQXwdbrGxKBJDMcl0p3agohH+1x
 mVbw4qQFfmeU39gYsCw==
X-Authority-Analysis: v=2.4 cv=HN9WhYtv c=1 sm=1 tr=0 ts=6afdd425 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=VnNF1IyMAAAA:8
 a=B9_qJ1oztFEBON1DZfwA:9 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: SR1mgnAxcme0IsEfMeOJtnII3aOt2ed0
X-Proofpoint-ORIG-GUID: HYttsEp0gA57szudWeTroFnngXI5AFGB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX8pA414+6GV9j
 4WKFLZ7WX0a9Fo9HrJaOnb6Z6zbCMnwY5zrNRGU5xykWUApcLhrHrNQaCptmPsVwLNzviQfYX7I
 Mp70m814xR+IgeMawGDc6yTnjp6KkP4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180065

This is another attempt to move powerpc towards generic cacheinfo
framework. This is spiritual successor to earlier attempts by Sudeep
Holla [1]

The context around this time was, when trying to enable Cache Aware
scheduling on powerpc using a llc_override kernel parameter[2], it was
pointed out that the llc_bytes which is retreived using
get_effective_llc_bytes fails and hence the cache aware scheduling is
effectively a NOP, moment the process has a visible footprint.

Instead of adding more hacks around with custom arch_llc_bytes, this is
an attempt to move powerpc to generic cacheinfo instead. This removes
the powerpc maintaining a separate sysfs entries for all caches.
A few modifications to the generic code is necessary due to some of the
conventions followed in the device tree specifications. The details are
in the respective patches.

If this approach does not work, then I am afraid we might have to fallback to
arch_llc_bytes.

Note that initial draft of the work[code,changelog] was carried out by LLM.
Provided the device tree blob and both powerpc,generic cacheinfo code.
With few iterations, LLM did generate the right code with few tweaks.
Only the cover-letter and Patch 5 are completely from me. Thanks to
LLM, this series is in shape in few days otherwise would have taken
more time. 

Tested the values compatibilty on Power11 Dedicated and Shared LPAR's.
All the values are same, except id and uevent which was not there
before. That should help rather than hurt any tool.

This may need more broader checks on different boards/configuration
to ensure it is same. Also DLPAR CPU add/remove is not tested yet.
Please test and report if your board/platform shows up any different
values in those cache entries.

[1]: https://lore.kernel.org/all/1424715500-21725-1-git-send-email-sudeep.holla@arm.com/#t
[2]: https://lore.kernel.org/all/20261023131646.2907938-1-sshegde@linux.ibm.com/

This series is needed llc_override patch[2] series to work. A subsequent
version of that will be sent out soon.

PS: I am working with 90% coffee and 10% sleep.

Shrikanth Hegde (5):
  cacheinfo: Allow architectures to provide custom cache IDs
  cacheinfo: Support unified caches described by d-cache properties
  cacheinfo: Add teardown and rebuild helpers
  powerpc/cacheinfo: Move to generic cacheinfo
  sched/topology: Remove stale comment around llc_bytes on powerpc

 arch/powerpc/kernel/cacheinfo.c           | 994 +++-------------------
 arch/powerpc/kernel/cacheinfo.h           |  13 -
 arch/powerpc/kernel/sysfs.c               |   3 -
 arch/powerpc/platforms/pseries/mobility.c |   2 +-
 drivers/base/cacheinfo.c                  | 111 ++-
 include/linux/cacheinfo.h                 |   3 +
 kernel/sched/topology.c                   |   7 -
 7 files changed, 194 insertions(+), 939 deletions(-)
 delete mode 100644 arch/powerpc/kernel/cacheinfo.h

-- 
2.54.0

