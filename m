Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E985C503BCF
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 10:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861801; cv=none; b=BVXSghew7NKqVfse/RwOLw15vu/k2DCh/YP8YP6sbDgjJo/lyJWtQJh/cqo24affnp4U7ejQKA4Y6mUBmSK2U0dVjyvy4Qjvf8X351utLv3EYk6s7f12zgWN1GQR4W73EzzBxkT5naJrsvxEG5S7d92n9lsIqO7lcmi76SONDHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861801; c=relaxed/simple;
	bh=gU3el5vBaKIowxWErPSf+Ml57LVgUfxjbCElgrhuRcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHyssHz8Dx0ihJt83JdN7OaavWGJAURHAvGMj8EuO6nJ825tui2fdoCdRPVblz281cuDdjD2Di5bhk6R+yJoF1Vmd4V9UkkKc5b9i3+vHpuw4MZzNgyTxZA2YwyrxVhjEF0I6ecGfIc68+du3Su/ibnFUH6hSXWzf/Ld4v1KAJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0tFBxn8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djcaMZTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0tFBxn8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djcaMZTO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886MPTA2156046
	for <driver-core@lists.linux.dev>; Tue, 8 Sep 2026 10:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rfmoRRos15ggGyuCj+3H9fL/
	SgvX7ZnyDI13Z33CBSw=; b=D0tFBxn8ZVxw/JXA7I6wUpKQXpfGKOM3vRPs3IK8
	5CL6MVDqRo1W1YViRBo6aRyRH2jaf+JTkAmAxuVvA683Bs/Tk84laBk7+BAVR9Jj
	XoavlV7SedRkB6iU57sWromNNQkz/BA6uHlE1C56bSCnQqnoBXOGmDobLyoEQejp
	OmSDyPOZNDKgqqHXrz1WKUYW+MIWh9XyIK3RfiUkDW6BrIRskJWU0zDjKMIQarYf
	opqatafYdUE9ZvG4nuyUPIUqWvMavlLiqkTYHtLGG6ta5Hk/PQUnHIZYa9ol/cH7
	fikja42WTLvPLzz+wNBQO946IB/BC3xU2Ci+SPNmEPessA==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwjvhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 10:03:18 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b1b19eab8bso2387345eaf.0
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 03:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788861798; x=1789466598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rfmoRRos15ggGyuCj+3H9fL/SgvX7ZnyDI13Z33CBSw=;
        b=djcaMZTO1UwGSahZsrhmsg0A+8SS7fTfpjCqv9LmOuEb7nWv662hZ0zy2NPXmJthCE
         k1p03Jn4ymrypxH5jUBrWuNSN9CLwpizULqQyCilkOl/iILgkbs410a+yuOaPTXl6Yd2
         R5NdYzKnEq3uIgufO3oqbh4KVVvI42SntGXhjYtYFXVWN7/At2/cbY5Qa6lEa3N8aIcu
         7ejF2cKyM9XnWAnYETcWVWvkbhbDeNrCvEw/IGu5m5wmkh7aIJeB1IBgno3M+6ZG4gkE
         HBCY55hQ4ZgJUMVtyvA9C6NMnWw/DD3e9SnCRcdWBxEaP8fqPaTygkxC/Rqiyj7iz+xB
         s8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861798; x=1789466598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rfmoRRos15ggGyuCj+3H9fL/SgvX7ZnyDI13Z33CBSw=;
        b=Ocggup6VAnyd65/7EHfnKNhtZqDGGTjyCNuF92It6/yG2E/fnQ7LPT5R5O7TckveLi
         xSr06DFLDTKcuJjXTOUe/S8fb+/a+jfBaLx78v1LLnVXqKRmd9aCEQJ3aHI/QoyhnDtP
         NWtj5GAuv6eRM3VLMud4vrFYLq7AhvKX3gB5ubCKGu4XCQ76lxYg7ZWnIfMgcbnIaJfZ
         f55famS4Nuh4YLGbNI6dGRUQkAiYHE9vKVI9v1zBxXB072Mpge+0j2C9+BCVK4MDLOhC
         Z0kzHcc4+CQhKifCA3U1GQ6fwbMBmVfDrmMSte5ks6/dvx4SUb+zle+ixG24jKXW1fYT
         tXlA==
X-Forwarded-Encrypted: i=1; AKwUvBwk2YgJ2r22yJI07QCeypWQOwO5CsktYZ3b9pQPYd4gJgJsAHgDnQKVSILGrCW9p7wMlAPK/T/KlNeN2Q==@lists.linux.dev
X-Gm-Message-State: AFuF++m2HG3XSDd2yKnrZWNjKizSKvhNS2FnFWfWtuIIfq9bnBHWwdYS
	xOh3zjsBvJgFmkXfUKwhxChF65xohEVJSkdltxjN8X8mUlKLiJ5RMVBTTWFzUDpP4n8pZvJzA2H
	AunzDNwkmu7p32V/ZqGp/R4HPXwfQf5MX5y43I/a4ok5fbEFf4yHZANmxQoOobAnsCQ==
X-Gm-Gg: AYBFou0a6gVRiQxsv8zAhtSQJOhjwn6zSpC+SQ6DcvZYe07AaCGxRqjEUQNmB2KgELa
	HqKD0aEyOrBI6u6g2KypqXagPwUu/02qRf8hqh++tGDoqydPnMpBwqT7VcpllDb/mFlHM9KEARK
	xNjlDOGByzrkPcFHE+Gx5MQsAKpA9UGO3XSz24+wuNra7nVMS9tBTx4oTpTHSOXMXqqtWRyyoFQ
	VN/kOsJYbkoCgIJoXAOiDH0xS21fG4XyIxHpE3WcS121OfSGHzb06qETD9KgYClCGAKdEEqQXHG
	EUkwkwaOgnwIXdn0SYlU+0rrrxS06SVe08nitK4BT92BfETOaj1HyASEo56e947rTgCSC+fbx0q
	nmrQ/r5vWU1QvJnD52zdVeBbeJX7UoG3j1IIh3olTS8sUbusQjYUD3zOQYbCrorO5NSqRXN+P6H
	a7qY7gL3IhFtgc1jQ=
X-Received: by 2002:a05:6820:988:b0:6b0:19bc:fd14 with SMTP id 006d021491bc7-6b6fe59c264mr15048386eaf.32.1788861798140;
        Tue, 08 Sep 2026 03:03:18 -0700 (PDT)
X-Received: by 2002:a05:6820:988:b0:6b0:19bc:fd14 with SMTP id 006d021491bc7-6b6fe59c264mr15048341eaf.32.1788861797698;
        Tue, 08 Sep 2026 03:03:17 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143240d86c3sm31124434c88.0.2026.09.08.03.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:03:17 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:33:12 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 0/2] sched/cpufreq: fix schedutil's boost frequency
 handling
Message-ID: <ap_a2uVHgjiNtL3I@hu-anancv-blr.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6a9fdd66 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=fTh2YsA6urFVvDZ4lSoA:9 a=CjuIK1q_8ugA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfXyBap27vFwVf9
 QBxM4Rj9O6fFLteRSX6tsg9Dnu8HGtQ8qWIBRtZP4R0onZlX2SveWi9Y8fJTInmYjWk2Sn6FLrC
 3+6g0JtojD38xWzK4hkC8lFz6jkCoMBqGNVPj/OTf7HPpqmSYWs84GnK6KQ9kcE+veDQjfFaIz4
 LqFqyWrhL2/ZBefutrS24EPrh7sFp/BDP8eSOceGYLX4Ad7ChxREL4HaliIO5zr53NH32fqz4jb
 Ig+Fh7wI2J+3wdcINNvoYf1g8EbptbGa2A98rpjPalHd12gu12bl9sB/3MC1NajwJKbtG4/mflU
 7IqnHk9mspxDRXqNbZvkPvRiOV/pzVDUXD/Mi3fJJkOiTfZaSuUtPRTcIGOSh/kMr9oAKz+qU5y
 pHmGoJ+cVwgU+eAHx9BvtzTGkKxBSiwkdyslRNZedI6CKJISYKXhtP5KhWTCg1BHt+3mMadUkj4
 STSYpiy70m/gFcmFBGQ==
X-Proofpoint-ORIG-GUID: gL0TyuskXriGzEKvm6iWNyrB4Sl-gCWH
X-Proofpoint-GUID: gL0TyuskXriGzEKvm6iWNyrB4Sl-gCWH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfX7AfeTeoXJBIB
 MylN+BUIBYSw6ECid6ItrlBxteGbrDQKW45E704US4QrfMA88sVwS7Ixaoplrth29Lh940hlTMb
 RUH2Y4NPDHuP7vx/nBMjaPEmhjUsIIg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080106

It seems some mangling was done and all lines starting with hashes
were considered comments and ignored, malforming the logs. Apologies
for that, this is how it's supposed to look :)

Before fix
----------
# cd /sys/devices/system/cpu/cpufreq/
# ls
boost  policy0  policy12  policy6
# cat boost
0
# cat policy6/scaling_max_freq
4454400
# echo 1 > boost
# cat policy6/scaling_max_freq
4723200
# echo 0 > boost
# cat policy6/scaling_max_freq
4723200
4723200

# echo 1 > boost
# cat policy6/stats/time_in_state
355200 36958
4454400 650
4588800 0
4723200 0

After fix
---------
# cd /sys/devices/system/cpu/cpufreq/
# ls
boost  policy0  policy12  policy6
# cat boost
0
# cat policy6/scaling_max_freq
4454400
# echo 1 > boost
# cat policy6/scaling_max_freq
4723200
# echo 0 > policy6/boost
# cat policy6/scaling_max_freq
4454400

# cat policy6/boost
0
# cat policy6/stats/time_in_state
355200 40147
4454400 79
4588800 0
4723200 0
# echo 1 > policy6/boost
# cat policy6/stats/time_in_state
355200 44834
4454400 93
4588800 25
4723200 569

Best,
Ananthu
