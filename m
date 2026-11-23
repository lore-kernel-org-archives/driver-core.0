Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429361;
	b=S32kSrJ3L9Z4jsL23ATOjIcfF/Ua+FdVl8wUXhapqH01Qi4+brz6qmrmBuzzklbkv4p7
	 V5trsgKuFuizTiCQ5aOUvnfPw7qWTrkpNmLb3qTbTKLL1M87ljYyzS4FFgloqPYV5b37h
	 uc18U5GUeYnqAPeH7m7NUdrSJVeP3K1HShhr2nymNtQGa3d3lf00G8Hy+HmJ7fMlD4Crp
	 VxN6Vsusaj5Ih2l/xOvKiufrggzY0Q0Azc9biXNQGPoJITQ7w5LOJNR5EDf7LjAYqFijd
	 Gp3qdETZFv6GNq4PijeQp5tnDNTxtfYeJFrdXpmHXgKdaK9XyiKjiIAT2D3n7FDr3nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429361;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CMMRc8fkPYs9hvIykQ+AxwsOetn52Cu1btsHEfj9zWY=;
	b=L+MGQKwtXPh9twqU9sgDXfFXOrASh8fxkYSrs7cV6jd72DJZqjPIyp5PzYG/QdMlLG85
	 1tdjxa8IVWGO5nMRz04UBvVvinln4M1EgOBMU4JKRO0jKhBAxyskEY7+RXIu5AQU5m0dQ
	 IjaX2tmsc2GGAgwgsWdJXUrXakT9UHjM4bj8grCpvDMzXhKyhbWzw7VJyrJ54vYcwbhtd
	 Et0dagpmVhPMigy/F+GvkCzg/RCtFzAzfmOq5igZYy0v661/taStpJ1LbGAqLgzw8wzZC
	 /l0qB0HHf9/CPVif23yDss58dyj7TRYqNzEMRGpVzumZlzmcnQM8dDYaO64l+XCQzRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oOkISIJA;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d57OpDVG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6CE0606A321
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 10:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6CE0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oOkISIJA;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d57OpDVG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G22r917411
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 10:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CMMRc8fkPYs9hvIykQ+AxwsOetn52Cu1btsHEfj9zWY=; b=oOkISIJA5l1vB1Zi
	TPZrToYUVdfkGOXa6wJxaj7bf03JCRFN+fjPp2QOj9WQbIbiuzh83XFVDK2EgQPv
	CWOahCmkqDbXxCZOnSW1VynRhydqJnrXkCUSfysh5wV6xOss375NAX66qL7SRrgB
	7IHPiYRlk+hXC1qXJuM6V+U3enK0tPOKYeMjIDI2t1GlZBqAVhWZU4CR80CmM0dO
	CzQ91Okwq9Ng/dGuqt+0kICXXI08bvQapA71lWFvBDxwFdhhYYjDMBdlru9wXTqz
	KN2eRD5Nl8MVXfeSyc1h4IVmQYWHwQ9VE3Ea0gvyQLsV5PInsc7ohjr7t/V9AxqF
	JCLnyg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a0uun-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 10:22:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed05b3eaecso28194315ad.1
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 02:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429359; x=1796034159; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CMMRc8fkPYs9hvIykQ+AxwsOetn52Cu1btsHEfj9zWY=;
        b=d57OpDVGvjcpZA60GQy3fluNTtqYYV2vVDlpe3ZGVJO9OELKn5C/S6WOM4qSG/S7l+
         Z0/3mEwP+xfK80MGEOv/bYqDgOqyQh4CbVRezbLHmTF7V0hE/7tpYk0t/w6MM+zGvQl4
         WWZyCmoyHwp2KCPOpzXJeb7y2t/+mhS8iAN0F9+VdbXHn9l+EANB7/bf0kAudADZ3CGP
         Z2hPDfmhu6aRA6S+zNxZiCTCBk/4ARgPmVwrlA6iyysFJQ4WqpnS8CngZMnG2G0bVOyc
         ig2mOUaxHHPAIHpwQB/egGkTGA+4SwQ+PiPvKvvWT9sJw23PVYbTnM8QnPHQRlgSbeq4
         BzAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429359; x=1796034159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CMMRc8fkPYs9hvIykQ+AxwsOetn52Cu1btsHEfj9zWY=;
        b=H++XWZsQHZrl3fs3CYXVuhgPtTQ15kQWdS2rGCtGeCEakTftqFbiB9oQSeXc1pg9Sd
         +HvLmeu63Fkw4/ngtXuxYVS/oS+Mm3s+2e5hCMCyxikac7crM1K5CYEbtu01/Fig7WTq
         8zBXyf325ujrtg42qz4DFTPzaxYfJaxBWW1r9H/690WC8jMUjt/fUQ7wh7wrRUq2yu2a
         XL/LtEK3FCt5M2jUefJutfeKcR0yra+Dw6tXrwhj8U2U02fBI4IU0Tg+/Li/e0s3g6mL
         wm6Lr7oHxbU/w26DalE/HK/p5UyCEK/f3OaA68PFSyaBtkbmQuXXj0WJ3vJOu0ijDFKR
         gwtQ==
X-Forwarded-Encrypted: i=1; AL+hErEO+lQbpb+peX7CFaYEovzO1HAunLA7vZYBRyyOSpW7IFhOrMrNZ6VrHYmjU0FHcLol/cDxtmCYkaqBVQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/W9WfvnDL+TRxDksneQ0vMOagC6ek03oCD/tZF2Ag9Ms0rU1Y+
	zBJqjj5JHgEsfxgrMoWFyj41eDRHPsOVdmXceI5h6QMK983254WmObBebkuxcB/L7aE9FwFfVny
	V8yi9149fKpKVYR7DrIAVR1/6Rs8fGP2h+LyZZMjX8s33bRZ2awFSmJZIwzdO2D4UmA==
X-Gm-Gg: AZFdTZcO35rozG4AYeRtaVJ097Cxtd0E53I9XsFWY4FQFMFMw+rcsxthHo0p7dL35gD
	31EVgMRN3VLuha+KPmAniG1SBjXJvspmAsW5D5jME+JJ+TC0qc4aAZoQS7g7DuA+j3MFqYo0W0L
	mKateUginxZlvrboQpWTZheGl+HeaZ9jeqHh65QmVur9XjMwy7GZiQ+avF9/Rqnif22aFjYJPzR
	CqN+j/LJpl9WiYI5NBKTn14QsLWT9Bqfn1mX29+KqC7ml3lOLjGcAvcnRPyGmLE7wRQwbakKl5W
	4cZNCKcs4Wq1keYY9XZUKNYaDbx/78dkc3gTBiygsl58QfADvUdFGaH1w5E+uvopy/Jz8nHVNzU
	f7xrnkHIlP8BWfcvPqnIncEA6pA3LBoBzt6naZgO5w0x/3rCVL2jkqUAGZOroTi89V+0eyONOUO
	q9w3McvxoodDC5wwklTvZer9RIt4bvEGOFcSs4cHUrYa5WHWk28cjA061VllphAP0=
X-Received: by 2002:a17:903:b0e:b0:2ef:ced4:35e8 with SMTP id d9443c01a7336-2f03f1e0d60mr102848865ad.52.1795429359036;
        Mon, 23 Nov 2026 02:22:39 -0800 (PST)
X-Received: by 2002:a17:903:b0e:b0:2ef:ced4:35e8 with SMTP id d9443c01a7336-2f03f1e0d60mr102848545ad.52.1795429358456;
        Mon, 23 Nov 2026 02:22:38 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f04a49cfffsm42736285ad.46.2026.11.23.02.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:22:38 -0800 (PST)
Date: Mon, 23 Nov 2026 15:52:31 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jie Zhan <zhanjie9@hisilicon.com>,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <awQT59OrWPyMzxtc@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
 <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>
 <avwtsmp7Mqacbbtl@vireshk-B250M-D3H>
 <av2aFWw3kh11U68A@hu-anancv-blr.qualcomm.com>
 <av5_zDI4bg28H_6e@vireshk-B250M-D3H>
 <6d6a84bf-29bd-47c7-9243-ab0b9e2d7f32@arm.com>
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
In-Reply-To: <6d6a84bf-29bd-47c7-9243-ab0b9e2d7f32@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfXxStv8+atKn5m
 yAXgeMCYIWx5RNbwB1Zw35fu3LgFHajSRU4WObFMgDjJQ7d+81y3cTNv9IUlwRb9iWyO6dM43i5
 iFXvXeYTl799neNhLRwXyzD4SromAIg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfXx3zytOPWY2Hj
 0Y0jFPt+smWelrGKNXa17R54oaJtSSiyevoX6VgQAcnBe42d/GN92btAFcIXIlUtmDXgvzyL+Xf
 bOq7aEeXBZG46ZxQ0rQhj63A87YFioSJRFeMy4FlG0pn9YnL5wqRY/hCir1xE5FNTAVxsaRLCaa
 ST+xqHw6pKcBSDBuhfMOLsRBZGgb2UIhTwTMzxYqBOvRpMof2bJHkmDHqLCJPJKZ8zxNPkNfzNx
 DfmOTrq55bXN+cTl2SvKYHyZXLxJ3DuZrNbayxGt5Vpe6sbV8suSZKb6fSVgFxTwIVf6gmxtmAs
 1FyH0eWy04cP38FQAsJGXWIwMjuweQZYOp5QUh8+uDpNECOUxZjd43HQIMduqe2D7LKszraEwRb
 X9khBRzOlcxRCElTeprr0o8NfDTEqOHl7Upv+18gUkraqVJYgoOI5YptUaSdXipbeBO/X2oPRAr
 DaP4RscItCfmF8jpM4g==
X-Proofpoint-ORIG-GUID: ffobGOimIhQue-W66ZsVfpABaVwj_Xe_
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0413ef cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=8nJEP1OIZ-IA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=BWWwL2AyREb5ywp_J3IA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ffobGOimIhQue-W66ZsVfpABaVwj_Xe_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230041

Hi Pierre,

On Fri, Nov 20, 2026 at 01:08:01PM +0100, Pierre Gondois wrote:
> Hello Viresh, Ananthu:

[snip]

> Sorry for the wall of text:
> 
> cpuinfo.max_freq is used for various purposes. This patchset corrects
> some bugs, but ideally the usage of cpuinfo.max_freq should be clearer.
> cpuinfo.max_freq is used as:
> 
> The max hardware freq.:
> - cpufreq_schedutil.c::get_capacity_ref_freq()
> - arch_topology.c::init_cpu_capacity_callback()
> - cpufreq.c::cpufreq_get_hw_max_freq()
> - intel_llc::cpu_max_MHz()
> - windfarm_cpufreq_clamp.c()::wf_cpufreq_clamp_init
> 
> The max boost/non-boost freq. (i.e. without the user-set constraint):
> - processor_thermal.c::cpufreq_update_thermal_limit()
> - cpufreq_ondemand.c::od_update()
> - cpufreq.c::policy_set_boost()
> - cpufreq.c::cpufreq_update_pressure()
> 
> cpuinfo.max_freq value depends on the presence/absence of boost. It is
> thus hard to know what the field actually contains, and:
> - PATCH 1 adds cpufreq_frequency_table_max() to get the actual boosted
>   max freq.
> - PATCH 2 allows to retrieve the actual non-boosted max freq.
> are trying to rationalize that.

Thanks, cpuinfo.max_freq not actually being very clear about what value it
contains is precisely one of the reasons why this approach was taken.

> ------------
> The following frequencies:
> - max hardware (boosted) freq.
> - max non-boosted freq. (i.e. nominal freq.)
> are CPU/platform specific values that can be computed at init() and
> which will not change merely because boost is enabled or disabled
> 
> The existing. set_boost() callback implementations are mostly
> retrieving these values to update cpuinfo.max_freq, but this could be
> done from the main framework if we stored these values (in cpuinfo for
> instance). Similar remark for cpufreq_frequency_table_cpuinfo().
> 
> It seems there is a lot of code to re-compute/update these values even
> though they should not change. Computing them and storing them once
> should be possible I think.

Right, that makes more sense. My original idea was to not go trough separate
iterations when freq_table.c already does that, but it makes sense to just
keep it entirely seperate and avoid further calculations of the same. As you
said, the values should be constant anyway, and once calculated they should
stay the same.

> ------------
> A. acpi-cpufreq driver
> 3c55e94c0ade "cpufreq: ACPI: Extend frequency tables to cover boost
> frequencies" added a synthetic entry in the freq. table to represent
> the max boosted freq. as read from CPPC. Entries in the freq. table are
> otherwise fetched from _PSS entries.
> 538b0188da46 "cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost"
> is known removed the synthetic freq. which was added in the freq. table
> as it reported the synthetic freq. to userspace which was apparently
> confusing.
> 
> PATCH 2 "cpufreq: fix policy max not returning to non-boost freq on
> boost disable" modifies cpufreq_frequency_table_cpuinfo() to handle
> this case, but maybe it would be easier to tag/flag the case where
> the max boosted freq. is not in the freq. table and handle this case
> separately. Doing the following for all drivers makes things
> complicated IMO.
> ```
> /*
>  * If the driver has set its own cpuinfo.max_freq above max_freq, leave
>  * it as is.
>  */
> if (policy->cpuinfo.max_freq < max_freq)
>   policy->cpuinfo.max_freq = max_freq;

I take it that (correct me if I am wrong) this generally means we don't
want to go implementing solutions for this in every driver and instead
should let the core itself handle this (which is what the current series
is trying to do)? A maintainer call on which route to go will definitely
help in focusing the attention there. ACK on simplifying the interaction
with cpufreq_frequency_table_cpuinfo().

> 
> B. The new CPPC spec [1]
> The nominal freq. will be writeable in the future, so some additional
> synchronization will be required.
> 
> ------------
> This patchset adds a cpuinfomax_base_freq field. Maybe we should also
> add a cpuinfo.max_boost_freq field to make it clearer when someone
> wants to get the max hardware freq. If we find a way to know when
> cpuinfo.max_boost_freq is a synthetic value, this would allow to
> solve [A].

The idea was exactly this when I went this route of calculating these
values separately. The previous revision was doing precisely this,
by adding a cpuinfo.max_table_freq field (fun fact, the initial name I
has was max_boost_freq itself, which I later changed to max_table_freq
because not everything is always boost capable :p). But the general
consensus was that, including the reviews from Rafael, we don't need a
new field added to track this value. And even for the max_base_freq
field the current revision is using, the general opinion seems to be
that we don't necessarily need such a field. Now, I am personally of the
opinion that adding these two fields (and calculating and storing them
once as you already mentioned) will make the calculations infinitely
simpler. What route should we really go?

> The new CPPC nominal freq. should always be lower than the initial
> ospm_nominal_freq field [1]. So an additional (struct freq_qos_request)
> for the nominal (i.e. max_base_freq) frequency might be nice to have
> aswell.

That sounds like a good enhancement, but I'd prefer to work on that later
once the current issues are solved, these are bugs causing some decent
damage afterall. But LMK if having that also is quite important at this
point.

> ------------
> Short summary:
> The patchset should fix the bugs, but IMO it is still not really clear
> which max freq. is stored cpuinfo.max_freq.
> I think we would benefit from also:
> - adding a cpuinfo.max_boost_freq
> - adding a (struct freq_qos_request) for the nominal freq.
> - use cpuinfo.max_[base|boost]_freq wherever needed, to simplify
>   the .set_boost() callbacks for instance.
> 
> but this might be out of scope if the goal is just to fix the bugs.

Thanks a lot for being detailed, Pierre. The direction I have taken for
this series is exactly this, sans the additional qos request for the max
base freq. As you have pointed out, the current goal is to get at least
the bugs fixed. So having the maintainers make a call on what is the
direction we want to take in general will be a lot of help. What do you
all think, Viresh, Rafael, and Pierre?

Best,
Ananthu
