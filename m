Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795070222;
	b=RiE2vVoPI9WIfpg2C3rl4qxc4WndMdZuhJyI6wpAVDCukJR6bF008PY6BaENzZrUo/JW
	 N6LxFibG8cG6j4f2DDi/aDoR4N92JF/ptuB0d+kuLAYPSPCmE/ark9aqHFGcjUTJVAKKJ
	 kfE4dfI4/ROlT5WTNUYPJuz/K2uHhcR8kvpHwrpu2/iEC5to+U/+6Bjih+CG4nBT5P/Yd
	 mONLpxBFYzDqU3aTKXJPZ1F42Z3MRtVXLenITbO2greMeo9BdLoaRYHl15zWCpZEdLekb
	 v7YZjJtpyPAvKH3fxRGuBW2k5SnYuYxqliuGC+vU4wzsV16ts//onsR8XOAIDZTLIsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795070222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pjHPwk1E/Rd0+mr0SORk3dN17ElTyExxuwM5wsK9YME=;
	b=tIELIYH6i4vff6splPnSFURVOu7MrNC+JAL3lh8TyCiPSGKm/36ivPm1qQqLoDJwFGZm
	 kFr8Yrv9N0xY4frzxxuyx4TtlIyLshEjWNNbkTqnkyo2jLQxtUbzaDqhX/Sfq6kjxG4rf
	 xIbpfHw7V98WWj8a3770AgvfBGDi1njtF5CGVk6yPdtrxDiMZgljNhawEUhq5g125ra27
	 XVWpcdEdyfHj1BP8MlRK4/ZlBldbmFug0ik2d55pSaYUDe9NU3EgME0VeOU9ueziAUIXa
	 unRPcO6Xd0v93StZ89TjqvTeeBIqUUJ2p46orErejDWRicBtP+vDfexKeyFnjVOK5yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sEGeAp0y;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D79606A325
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 06:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D79606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sEGeAp0y
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ4jVEk3324936;
	Thu, 19 Nov 2026 06:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=pjHPwk1E/Rd0+mr0SORk3
	dN17ElTyExxuwM5wsK9YME=; b=sEGeAp0yaHkISmVfn/H+AT3yiMDFOvYss5jA7
	VNa7OzKtB/zls62ROAQgkzYGGJqeAb6GLbCD+ry2nE5urNEZFGe+I/AsdlIHAU1o
	Y/0v6LY/JlmspGvzpAwPuhAAy6lcAtKZKvGBLy+3WKmkg60OnJVrZlxx77oy6SRK
	WTS9FDr2PiBttiKO3ri6sEeebKNvx46dKWQFPb1uYpKsC/bXl1w+wMOrgRZP0d8N
	f6x/Q1XqF0kRqvZ0/Q4eJdKiNU9KoWK8VJckjsY/gffdobwupEZlaCjMRmqVLbGY
	Jpro4NQjzj0Dxfj13PH/qTlBdRTUUrTUXr9cKGzIFy8R5vKWA==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105nf1eh-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 06:36:53 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ4odGE2850293;
	Thu, 19 Nov 2026 06:36:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j17c4vpss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 06:36:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ6anYl28115452
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 06:36:49 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C11320049;
	Thu, 19 Nov 2026 06:36:49 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA3A420040;
	Thu, 19 Nov 2026 06:36:46 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 19 Nov 2026 06:36:46 +0000 (GMT)
Date: Thu, 19 Nov 2026 12:06:45 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
        dakr@kernel.org, johan@kernel.org, sudeep.holla@kernel.org,
        ritesh.list@gmail.com, tim.c.chen@linux.intel.com, yu.c.chen@intel.com
Subject: Re: [PATCH 1/5] cacheinfo: Allow architectures to provide custom
 cache IDs
Message-ID: <av6Y_drdhr4B7RpD@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20261118163639.890546-1-sshegde@linux.ibm.com>
 <20261118163639.890546-2-sshegde@linux.ibm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20261118163639.890546-2-sshegde@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyNSBTYWx0ZWRfX7TGLQl6il6Iz
 PT7+YvsCD1UKmbMqaXmh640kFCWY4mvTSwmcgD/xa9WNIsSCl4W6MUBEW/Z6rnoYKuLG5Nw8yLz
 S1wnANLB4wrWGE/0LuvLsSPsCvBfWYMoZPNHdIOUDbmnJzjR32E5fk0I3u5ulLs1pvTvdvE101K
 1gm7nJOd3mgiH5alWTDcGzpTgwaewHYnFpDN/CNE9XLLT9DZOsSMAIpx/vNOZ0A6oVyvEDpKSDj
 IW1LiYrNnkLCrx3R2DatVwonmK/+P0zSXrvk0QwdvY/pRYHm7T0r66Yi8dw3uwjjBoU0oUk0NBN
 oISUv5Asx2eJ7EycrTfmajRAaE7AR6DrzOCZLy90njzWsy3zPJ3g9JLHqdIc6r4/7j4gwcJ3fuH
 2NH+QxLzpRFJNFJmwVaYXCLH5kUA+WmPvm1soixWzABvoNBA/8z3NeR4sJuO4EW/sHpmzRgamA+
 utzEDhEa2dsUKO6xuUg==
X-Authority-Analysis: v=2.4 cv=HN9WhYtv c=1 sm=1 tr=0 ts=6afe9906 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8
 a=qf9MpUAMVl5kCHco-JUA:9 a=wPNLvfGTeEIA:10
X-Proofpoint-GUID: NdlJHp9HPxWW0Atag2xioruUzNyrMgKu
X-Proofpoint-ORIG-GUID: ApT3kwa8WXuNa_jJFJRhAsj5Zc76ilOQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyNSBTYWx0ZWRfX3HEwcfJyX5xV
 FeAXM5BlJVCzlQM6tY9HlWSoz4eb/CdiToxFAxPCv9lBAiJL3XqbzBk4FuPpI0ehKFWyu8w0uT5
 VppFBPY6zfjWaOohi6Yrp5gd/aPXGAU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190025

* Shrikanth Hegde <sshegde@linux.ibm.com> [2026-11-18 22:06:35]:

> On PowerPC, a firmware cache node does not always correspond to a single
> hardware cache instance.
> 
> ---
>  drivers/base/cacheinfo.c  | 43 +++++++++++++++++++++++++++++++--------
>  include/linux/cacheinfo.h |  1 +
>  2 files changed, 35 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index eb8a907f6d50..10a9bbce899e 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -243,22 +243,46 @@ static bool match_cache_node(struct device_node *cpu,
>  #define arch_compact_of_hwid(_x)	(_x)
>  #endif
>  
> +/*
> + * Return an architecture-specific cache ID for @cpu and @level.
> + *
> + * Return 0 and store the ID in @id when the architecture provides the
> + * cache identity. Return an error to use the generic firmware-derived
> + * cache ID instead.
> + *

If the return is only going to be bool, then does it make sense to return
bool instead of a int, esp does it need to return -ENOENT
or may be returning the id itself would be better.

> + * The ID must uniquely identify a cache among caches of the same level
> + * and type.
> + */
> +int __weak cacheinfo_get_arch_id(unsigned int cpu, unsigned int level,
> +				 unsigned int *id)
> +{
> +	return -ENOENT;
> +}
> +

Can we use the #define, #ifndef way instead of the weak function
or is there a reason why only weak would work?

>  static void cache_of_set_id(struct cacheinfo *this_leaf,
> -			    struct device_node *cache_node)
> +			    struct device_node *cache_node,
> +			    unsigned int cpu)
>  {
> -	struct device_node *cpu;
> +	struct device_node *cpu_node;
>  	u32 min_id = ~0;
> +	unsigned int arch_id;
> +
> +	if (!cacheinfo_get_arch_id(cpu, this_leaf->level, &arch_id)) {
> +		this_leaf->id = arch_id;
> +		this_leaf->attributes |= CACHE_ID;
> +		return;
> +	}
>  
> -	for_each_of_cpu_node(cpu) {
> -		u64 id = of_get_cpu_hwid(cpu, 0);
> +	for_each_of_cpu_node(cpu_node) {
> +		u64 id = of_get_cpu_hwid(cpu_node, 0);
>  
>  		id = arch_compact_of_hwid(id);
>  		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
> -			of_node_put(cpu);
> +			of_node_put(cpu_node);
>  			return;
>  		}
>  
> -		if (match_cache_node(cpu, cache_node))
> +		if (match_cache_node(cpu_node, cache_node))
>  			min_id = min(min_id, id);
>  	}
>  
> @@ -269,7 +293,8 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>  }
>  
>  static void cache_of_set_props(struct cacheinfo *this_leaf,
> -			       struct device_node *np)
> +			       struct device_node *np,
> +			       unsigned int cpu)
>  {
>  	/*
>  	 * init_cache_level must setup the cache level correctly
> @@ -283,7 +308,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
>  	cache_get_line_size(this_leaf, np);
>  	cache_nr_sets(this_leaf, np);
>  	cache_associativity(this_leaf);
> -	cache_of_set_id(this_leaf, np);
> +	cache_of_set_id(this_leaf, np, cpu);
>  }
>  
>  static int cache_setup_of_node(unsigned int cpu)
> @@ -309,7 +334,7 @@ static int cache_setup_of_node(unsigned int cpu)
>  			if (!np)
>  				break;
>  		}

> -		cache_of_set_props(this_leaf, np);
> +		cache_of_set_props(this_leaf, np, cpu);


Would it make sense to get the cacheinfo arch id here.
That way we could avoid lot of this changes just to pass a CPU, or renaming
of the variable etc. We will probably will need a check in cache_of_set_id
to see if the this_leaf->id is set to bail out.

>  		this_leaf->fw_token = np;
>  		index++;
>  	}
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index 56fa646df0d1..d3557a1b464b 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -93,6 +93,7 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
>  struct cacheinfo *get_cpu_cacheinfo_llc(unsigned int cpu);
>  int fetch_cache_info(unsigned int cpu);
>  int detect_cache_attributes(unsigned int cpu);
> +int cacheinfo_get_arch_id(unsigned int cpu, unsigned int level, unsigned int *id);
>  #ifndef CONFIG_ACPI_PPTT
>  /*
>   * acpi_get_cache_info() is only called on ACPI enabled
> -- 
> 2.54.0
> 

-- 
Thanks and Regards
Srikar Dronamraju
