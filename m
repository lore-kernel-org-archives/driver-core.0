Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399046;
	b=QJratJ+TJEYzpD/OoA5pzrKvxTQvaOaHvaCKFJ//J0T4s8TI3naUIOtrZQMW4WKJHpqw
	 +R+eMyt15bUHDb/H2FN7R5Xyk9zj8Gyul2mYqKaJTSTDEMZKh7f4ouGyRJXft0g/Jhc3H
	 7PNWXtXU9Sxlr5/LkyMIsYg5h74uacBgmxA0wM7I91ZWKgr7xDmQSrnMESt/IvReDxK8i
	 9NDR102kMSGXY7zC3SD/j2yhLz7sInKH9Cyleyl9AXptW0MWm/xR5nC9zUdpiOSe21Qoh
	 8MBI2syGvgWQkDhKddKV/8aMij4hsUkm+hfQNer9gFYmrLjlrNdkC8CtW3Gl8BtdPaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=b++LVQW3MxBAHYI6B2X9YDdw0p9UtYRJwhL9UHx9t38=;
	b=kpECkWTzlVb8auc+y1Qjtj0fi8XkARDNkrv5FgSU5aA/n0uAjC97XzXOXf2s03pyLSoq
	 vm3wKjwJxu7CJtR5VfU4UPCglRfofEkc+nMWkJ+/mjslKxcpLdD4lM987U54o+wgOUDl5
	 n25WjQudAFSIU159rLbcQlegSCCoL/IafDOb8XFR0NUR1B690P4xP96KYfCdka2LYH9k3
	 TtBkS+sMTymZZSMmPdeZfZxbWz6HSPcOyBk3kfsj/wd8pcKgD3W0uGsrdQsPLevefeSxK
	 tugpGCNZ0w47S/riBa5pAnMMtyGepvzbpsQveEwTRr/615zOoDaD6/Nx7tAHVpb9nMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kY/cULp7";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NYVOjZL6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB5A606A31C
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB5A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kY/cULp7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NYVOjZL6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAbTJU1386446
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b++LVQW3MxBAHYI6B2X9YDdw0p9UtYRJwhL9UHx9t38=; b=kY/cULp7Ee4wJ+TP
	JvPyLbLdGBGR7z4fhkLBMdUI6xUfB+yp26GOgbc8GgU3Qg/ZlHSyfmJ+3dyLXzlQ
	SrvUIZ3D5jthnV7s02nDyusNyZEp0CPzPrhNrtmVyBZYw06uS/Lh0QpvQ0VQLVXG
	ktLoAWAmEpVdhzLV+foODwbdNU6jtYBvpTvlhR88UQHVl1VIWoa5Xo9Xu+jnKgOV
	/FrPQJMYbtrv0apfr7X3uHjE361P7g1PomuBuJ7i+CaKjlxSAGYrauq/zi/p+0pn
	YhaNpEz/nVdXxiofnXAB0+eR/vlLlPjFEXQSMNyP3US8dAK75r6WLKLi2f/z/l7e
	6y7ZPw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmaggf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:10:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3acc98e3b3cso2521627a91.3
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 04:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794399043; x=1795003843; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b++LVQW3MxBAHYI6B2X9YDdw0p9UtYRJwhL9UHx9t38=;
        b=NYVOjZL6v1XCwAXGWge+VkYMxKyA1ws8oZsd/iBQ1eBbHx+cSz0wYaL6RnUNQxE+xC
         NRtOrW4zuA2uj5Ik4sEKWETvHR1Fxop0SNdWMUz+7VoM3B8d8tz+6Oeao09k02YAg3XR
         SrOMiGRD0e3cBgA/UxSac2f6/YWFOPK7tJuBj1PK5pJIqj7FADuKlAL9xp8ZowTe+OoV
         DvnY9RsAL1GiMSgKZcy+RxkIjLnZf4amPGmm7cfEegByazI0IAO6TueabJGVYa2FbpjK
         4H6veCL90Y6gUSa+Mbp701KqkICL1dPYzZxruyGlJi5dZT5q55aHUux8TUqnapWv40WY
         c3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399043; x=1795003843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b++LVQW3MxBAHYI6B2X9YDdw0p9UtYRJwhL9UHx9t38=;
        b=Gd8RCERwVEzrKQhWhF7k9ied5VJCzC+8y4V74XCQFv4J1XKGJBNYajSzYY8SO69AJf
         W8aqT169Dh0dXxsTYxLImI3nRcuMeOwwDgHvMI82I4b7B3TmmaTh/kwQ6L9txCjI3mQ1
         FRv1cL4OB9+FAMsxkA7Xi0HRctTRogC26qVRyHtBvZxsxmZwS2ItBDGZBaPxxzehd0uv
         rNxXYCwLxroAgV5bT/SuVdAnV+Q3i9zZZVlw0jCtCak4WRHS3cZ6Qs5S1fuuz5gWlDaG
         WEU6xTs95qfEguCKFLyIgpHqs5bax7XPPv31G9UXSLoV9utIYEhXDMbf82Myq+IBPP3P
         IrVQ==
X-Forwarded-Encrypted: i=1; AL+hErFhn0RwOT6BURaffT89NNFKOtjcVBR0h2gRJvx4kISx5qaHXuR1gwIOnFTTuLpKBwWiTDK4n56jRf/1Zg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+UrtRcjqBEH+HRvPBrdrmyY+geKkDQhK9u73NqJxXu5UQ22oe9
	n8GCqAbAjLkpFQwkRQcZt2Xq94Hm5yVtsU2+KUUQb5U3F+1TS//wqwbBBCgea2kabqKvlLB+25a
	yNpk+1V4WJaUpnBGAt7xnUS6WUa40JuqZP5KeIyufAquMs0kE7Yyk6rYmHEO0px+HYA==
X-Gm-Gg: AYBFou2rntQudTtZmGFct3gq6rHqQlKTBOFHJa4+e7LChKiknTURfDBqbe4B9CJqR9x
	to52UhZyJ0gBoqkeXm6KYyzlazMyqh2sWwosoEvESUcmSc6ll33ICimkz/c459xDvQHnyBW26yP
	O/r9ui0jjt1UQN3rhfTMnIKcxHb1F/2sguh6uwvNOsUNLDWOROPDnaD/19c41ttUFUKdQFTg265
	SynEBjpi1XuoYzuz8Yohs2+sqeaiI2UakLrwnJjAIt0c/cXXomMhuiwOT6jf5lbUtgXZD4xFhWf
	7KHpBM6l9Qw1DgNrZOSZxoXgnuIhKHfU2vqV965p3uQfJZAp6oHUXVCfjmDnYINTMNln2g2IXVQ
	7ZnnkLKaiBKMHglnGEzFwZ7XQbY6qvJua6NHKLJxFKmm2B1jBkay+pfBYzBT6Soghge/sJSqh5h
	aqQS5l5uIUyv49Aj6Q3oQP261e3/2lCPFNmAW37SiZxdwgydei6VDC6KjVXPrT5ig=
X-Received: by 2002:a17:90b:2f07:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b182f26e50mr2286505a91.28.1794399042902;
        Wed, 11 Nov 2026 04:10:42 -0800 (PST)
X-Received: by 2002:a17:90b:2f07:b0:3b0:a970:caad with SMTP id 98e67ed59e1d1-3b182f26e50mr2286473a91.28.1794399042327;
        Wed, 11 Nov 2026 04:10:42 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0df70asm4460130a91.9.2026.11.11.04.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:10:41 -0800 (PST)
Date: Wed, 11 Nov 2026 17:40:35 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with
 highest available frequency
Message-ID: <avRbO42GNlfMAbZ6@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
 <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
 <cfb79ffe-41b7-4e58-b3f5-fc9a28a4e413@arm.com>
 <77749e58-84d6-43c1-bd37-98d0046231a1@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <77749e58-84d6-43c1-bd37-98d0046231a1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: rl1nYo9ZrfPNQsI3QECFPt_TVnXOXvZB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfXz9IfUFmCBHth
 Ors+39pPQSBlfUrorcVm+TiUukI+/npJjR7s8RsKFrCrfIaglioorMrz3NY2Uzt0Bmc3US0NiTy
 3C80jSH68rsZSA0Am6wzCr7tCvsjvs8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfX3EE22T4SGMW4
 JFiCt1dWMSPlmB21+ExBuKfLL06xQzASxuGBdyZ4GvpyIbJdy4Q5WUslD+aeyTMTgpIUrRWKKS7
 fesLcqOud9pBE2HqYnB3ii7g7TxnzI8/ui0qyw3kv3ngp5zsVIIt8FHImH9BEqjx+lspPWekiRf
 BV/xkyRuDI3UvHVOE460MHf9VIKyMbWVcSxUgCnKN3CE+hze3WJcqZspKpvCpv6d4/FlREITXrz
 UudLdzSOjfF3LIVbt+w/i2TNjQOLPx8rAoqy/1uIIV/RIndxRgHgKWSV//UqOqpZ84fMEql7JeO
 UvZ+XBxOLTpgOnLdcxsZgA0+xY8UqVmqjxGITT9wHeUAf+6g1oA3xuG8I5TrS90405KHQoCVVQd
 Hr+idfcXtuCNbU7ai6phuZo01ti3SjSeyu6GnP8bxh4fzVfForjULJNXKMaep4/HwO7AlXtVm2w
 VmnAsA6EQSwe1eaWQOw==
X-Proofpoint-GUID: rl1nYo9ZrfPNQsI3QECFPt_TVnXOXvZB
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af45b44 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=BJpuNRGIkIodYMgpjU0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110048

Hi Zhongiu and Dietmar,

On Tue, Oct 13, 2026 at 07:28:31PM +0800, Zhongqiu Han wrote:
> On 10/13/2026 2:45 AM, Dietmar Eggemann wrote:
> > On 11.10.26 16:16, Zhongqiu Han wrote:
> > > On 9/29/2026 7:38 PM, Ananthu C V wrote:
> > 
> > [...]
> > 
> > > Besides, could you comment patch v2 Dietmar's comments? It seems that
> > > patch 1/2 exposes a pre-existing ordering issue. On DT systems,
> > > cpu_scale is normalized only from the CPUFREQ_CREATE_POLICY notification
> > > of the last policy, so the cpufreq pressure of every other policy is
> > > computed in cpufreq_init_policy() from the raw, not yet normalized,
> > > capacity, and stays cached until the next cpufreq_set_policy() for that
> > > policy. So far this was harmless because capacity_freq_ref == policy-
> > > > max at boot, so the pressure was 0 regardless of the capacity. With
> > > 1/2, capacity_freq_ref covers the boost frequencies while boost is
> > > disabled at boot, so policy->max < capacity_freq_ref becomes the common
> > > case and the stale value becomes visible (102 vs 79 on Juno R0, as
> > > reported by Dietmar). Perhaps the limits of all policies could be
> > > refreshed once from parsing_done_workfn(), after the capacities have
> > > been normalized?
> > > 
> > > --- a/drivers/base/arch_topology.c
> > > +++ b/drivers/base/arch_topology.c
> > > @@ -454,9 +454,27 @@ core_initcall(register_cpufreq_notifier);
> > > 
> > >   static void parsing_done_workfn(struct work_struct *work)
> > >   {
> > > +    int cpu;
> > > +
> > >       cpufreq_unregister_notifier(&init_cpu_capacity_notifier,
> > >                        CPUFREQ_POLICY_NOTIFIER);
> > >       free_cpumask_var(cpus_to_visit);
> > > +
> > > +    /*
> > > +     * The cpufreq pressure of all policies but the last one has been
> > > +     * computed before topology_normalize_cpu_scale(), so refresh it now
> > > +     * that cpu_scale is final.
> > > +     */
> > > +    for_each_possible_cpu(cpu) {
> > > +        struct cpufreq_policy *policy __free(put_cpufreq_policy) =
> > > +            cpufreq_cpu_get(cpu);
> > > +
> > > +        if (!policy || cpu != policy->cpu)
> > > +            continue;
> > > +
> > > +        guard(cpufreq_policy_write)(policy);
> > > +        refresh_frequency_limits(policy);
> > > +    }
> > Yes, IMHO, something like this is needed.
> 
> Thanks for the test verification and the discussion.

Thanks to both of you for the discussion and suggestions. I am noticing similar
pressure update related patterns on glymur as well, so the discovery is very
valid, thanks for that. I will take in your suggestions and include patches to
fix the pressure scenario in the next revision.

> --
> Thx and BRs,
> Zhongqiu Han

Best,
Ananthu
