Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395A55452B3
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988645; cv=none; b=O/ijlJllzCRG0rMjHh47L2IDp5H0f0qweALJBup8eyuibVVztp9LaP/2BJ0BUOokx/pQ9V0V1aUxesm+DFir1dynUP1/oF3aWSOn9bfmXdb4+kdAJ9wZKxSUPkXB7olKbCCFsDtHnr3olW5Q8PdBjZz2Ng4PcAdHSSz0s1vr9gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988645; c=relaxed/simple;
	bh=dVDEZeeVpwKfDO5D/e9f64ogPrfvLXjQQ4eS7ifiyss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWVHKmfgHEMyAgmlAZO4P2BgkLSVpFO5rDZ4RGYaVqPEvhUyFltjWrZeVhUNJBMZLtPdyunIY0TwyS3AKWl/d5OKBZBzbXCVVTcbJ6kiZf9FPzPs6UGqRN6UfpAACXhC1hIdvul69j+hyR1/VcmfxHb6gIS6TiFh1dPd96/AoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1bLMHl7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTWF29uT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1bLMHl7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTWF29uT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbA1c1583026
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ytDfLGe1LAMcOenjJj+VpYk8
	V6Gvsv5lVqn+mQbsVlU=; b=O1bLMHl7YrKMUYM8Y55eN7Oos1DiVWVMbVzd7PvQ
	HCYulnmkr9BJCpw62LbKb6cvFGfXKPKbPSaLsdGq7t8NApwpo4OqEAf8aK9Cj7zu
	cT35JfWSUGlI1czH/EBtzRMsrqJulAFtW1LE9UvlF7VpZFKKYyH5dvK39L4Tr4Xu
	G1ODcszF2/FldHszWHPLqr0IwaaoFc6eHO1GaYTrcVVYRWW393BvM5jPnNGAYYJJ
	3czDQar0rAWMlp1C91Xd/kq58MIJPAOuMle4TFcIdooZ/+8oFzeThQAdibslGhEO
	SBBVisVeGHVZpszKBTNQjT7H0ufXmR3mO9zwQ/vEVmJtUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4td5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 14:37:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-917a2de2cc1so5864276d6.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 07:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988641; x=1792593441; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ytDfLGe1LAMcOenjJj+VpYk8V6Gvsv5lVqn+mQbsVlU=;
        b=VTWF29uTHNespBE7xunOJPxBnyGsaebL4nU/Dgdv6e9p4FRC85UcHZamRRtni8fMiU
         9gphefYmFN/5xu6LPB5B5Gm9Zmzhv4hHcyck9hRXE49grktkbjAMvBWblTE+7IPxnlbs
         FWL3dPmhDUbMMJ6HAZavBO4e41T7aAwbk1GmsqzV7Kw4WEhJ+TOHPgtHqGPumDge1lQ6
         gMFPRRM/fmgKMD8JHYqEx0A88yD5NQqAg1BIbx7yZRRgtVklY+KcV6L2OMrhe4TwOuVQ
         kMmjK61VHUO0czFJyyJE/jVqrriGwuM6e6nUj9/gzhnQ26BIul0DBamC7X17T+/5D+nA
         IpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988641; x=1792593441;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytDfLGe1LAMcOenjJj+VpYk8V6Gvsv5lVqn+mQbsVlU=;
        b=s1VEwYW94VZMOuUCINGGrGkMc/r2RtZcSwlslO8mUrco9kWfLLFduMvJjRozzHtq/4
         bBbxunjwco3cc7x1S45n+T9FlHCWKa4uKxhOq+sTpp/O7P3Aguyqhpa92izJQgawbYXQ
         Dhi49YTSiodyJY50Vqfw8VjYsJkNchhBYm1CBkr4rorgG9YD5MTLSKcpgSClKRHNo7AM
         Vc+bZB98LwAuuQzOeq+RLU8xt6IxNOUhzzsZrNJRZJq2hcBOslEvawKzvk+dC0PuXqcE
         miTCkC3Ric9r519vdXeGo6XzcW8fcKqTFtdxmXXP0PC1RqYh0yu3IYkBANihFUbm65Yi
         BEFg==
X-Forwarded-Encrypted: i=1; AKwUvBy37yPOmez/kH+kJvAwX0LS2xlqRxu8G3b2m2f8EUdBzRD+CEvYEhwlvJ/Fr9Gr5JjPjPgxTLCOdiC8zA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKxVMj2PdrUBZXlHl46vr+mVY1wsX8S8wz/po2XF1ywt0zZpL+o
	YpKRiBH1eL+JCeVzTWFpsKmRlahOfdU6GNMVb2P8OnYUQZ9LiQZfCH1Av4HAuPHbSngrQr3hyfc
	8ydZmqzZ8RHbNY1iLzwNaFBKa3c34xpZcsq1SHDVbxgEfd61ZCW9Qx5J0zhjXgIy8dA==
X-Gm-Gg: AYBFou2j1jb0PTTL5Q/3P9I6qr+E1Fk8Y+VEQQHw3rG58mudzhZbwmzy32byIU5b13f
	QafBmE8eZv6T4ptEvrpa24PHOptkt8aMvMWjHq+VxQsawsBp9Skli4UCcSgpNchbuUnzNzF/8L5
	CvDCx6XtqtB9MPOLGWT7VQ3A1+Dwmseq1May5Zn3lAGa5yqnVq6IOZz0DNsJ6IXDtYFJCZ78Rtb
	VQBylkE6aoJ5H9LNVWqLfWBVqFrAPKReW6MIKvcuXJI72n7aC95NSL+GjTC8/MBiNWEeu0woBLI
	Gz9wvRpBoyiK7EnMCA6wb971ZPu8/q7TuqJKfqMUBBfixGnZ433sA+3muibQ5xvRVQB1YYQfwp4
	1kUFwzdxnS6LwZmrKcx9ZY+Wt3Yd0uC7f4LuIbtrq94PeVN982uu1Qs85c48wpg62Pzx0NbBSV0
	balEDr8Shfn9mI
X-Received: by 2002:a05:620a:730e:10b0:93e:e531:b799 with SMTP id af79cd13be357-93ee531bc03mr1076632985a.57.1791988640902;
        Wed, 14 Oct 2026 07:37:20 -0700 (PDT)
X-Received: by 2002:a05:620a:730e:10b0:93e:e531:b799 with SMTP id af79cd13be357-93ee531bc03mr1076627085a.57.1791988640194;
        Wed, 14 Oct 2026 07:37:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3aaf62760e3sm3805911fa.4.2026.10.14.07.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:37:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:37:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [RFC PATCH 00/16] Centralize the ownership of power rail votes
 for Qualcomm clocks
Message-ID: <bpaaeh5bs4cw3tnk6y42gspbodciamak5mwjgtihlllduws4xq@7qd3sor3ic3o>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf93a2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=BhqdGhISfxfWxDvfeTEA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: XwmgudsgfLD98GiVOx3nG_L9OERcr55q
X-Proofpoint-ORIG-GUID: XwmgudsgfLD98GiVOx3nG_L9OERcr55q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX1/FdGdd2HdZp
 cMWIn3Nrfh6Dy2U/e2AJvuq2KvkKqrKAHhVAsBi66ruh228xYx+GCaDmViI1a7dY05Ooc1/mPFL
 iirpFX/rolLkh+nWLKfo8kXdjo7LZmbbMG85hapiFOBwvMNGnjG/q8Mrnkxy58BvwAFrfNY7Q07
 8AOzLB5aXQU08G/stzguK+TIrc+KXuBVTZ5sA/M+BD7grQ1jtJaQmXF1oK/ZbIVs06e1j4enoo6
 JrcNsSVo8NWV25x2ZSu5grNi5aPrDJxDMrKOAY2iVfS3ZWyq3kQhRywuYeK1yeJTdIYQDQulpKB
 fO7CLhIAsFHGVbJTbPyVM7CB4dtzpvoSeutXkMTQU1khs3WzKSJpqGfJRG5XdbnVgG8Bqvd1ple
 BeZ6VRRPEEkjoxZTdWuHKaAaBWAyymJxAnnYmQYVuCiyQ7W74T6nQN+c5ECk3oU7gtoxdLVSclR
 nlEhKUOQqQNVeZq5HCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1OCBTYWx0ZWRfX4O2vm6LyZXMo
 W5B1Yve9tjXXeDWq7g3tH9g5KA8s44FT2hIbSR1iuQqYmpS971ufl+uVsr3GF0PsJZvmuhZrz+2
 OyImxCdtLPoWcyrBwV4zmPQBfcpMRac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140058

On Wed, Oct 14, 2026 at 02:19:00PM +0200, Konrad Dybcio wrote:
> On Qualcomm SoCs, both the PLLs and other types of clocks alike require
> specific voltage rail levels to operate in-spec, but through the
> separation and decentralization of clock and voltage votes, these
> requirements are often not met and are never explicitly stated.
> This results in clocks being undervolted, or at the very least a state
> we're unable to reason about.
> 
> The devices consuming these clocks very rarely have their own
> requirements in that regard. (1)
> 
> This series moves the frequency-power_domain-perf_state mappings inside
> the clock drivers, ensuring a single, trusted source of truth is
> established and that the silicon is no longer driven at out-of-spec
> conditions.
> 
> To illustrate the nuances involved, here's a couple examples of hidden
> dependencies, as found on SM8650:
> * video_cc_mvs0_clk requires LOW_SVS to run at 900 MHz, but the
>   PLL it sources the signal from requires SVS (higher corner) to
>   produce that frequency. Similarly, to produce 1140 MHz, the clock
>   requires SVS, but the PLL then requires SVS_L1.
>   Analogous story for mvs1_clk.

Is PLL a part of the the same domain or a different domain?

> * gpu_cc_gmu_clk requires MX to be at SVS to output 625 MHz, the PLL
>   requires SVS_L1 to produce that frequency.
> * A number of camera clocks follow the same pattern.
> * Additionally, some clocks like cam_cc_cci_{0,1,2}_clk require
>   MMCX to run at LOW_SVS, but the PLL has the additional requirement
>   of keeping MXC (a wholly different rail) at SVS_L1.
> 
> There's a broad agreement that a consumer should only have to care
> about the clock it consumes, and that configuring its parents is the
> responsibility of the CCF. Requiring the consumers to care about the
> above cases (as is the expectation today) is a clear violation of
> that contract.

I think that the conclusion was that the consumers should care about the
full set of supplies they need, which includes all transient and leaf
supplies.

> A clock controller may have on the order of hundreds of clocks, each
> one with its own frequency-power map, and potentially all of them
> could be similarly affected.

You have described several cases, where PLLs stand out, while the rest
of the clocks are typically more or less in line. Would it make sense
instead to solve the same issue in a slightly different way:

clock-controller@abcdef {
    compatible = "qcom,sm8888-clockcc";
    // required to access registers of the controller
    power-domains = <&rpmhpd RPMHPD_MMCCX>;
    required-opps = <&rpmhpd_opp_svs>;

    pll0 {
        power-domains = <&rpmhpd RPMHPD_MMMX>;
        operating-points = <&trivian_opp_table>;

        trivian_opp_table: opp-table {
	    compatible = "operating-points-v2";

	    opp-100000 {
	        opp-hz = /bits/ 64 <100000>;
		required-opps = <&rpmhpd_opp_super_low_svs>;
	    };

	    opp-500000 {
	        opp-hz = /bits/ 64 <500000>;
		required-opps = <&rpmhpd_opp_turbo>;
	    };
        };
    };

    pll1 {
        /* same PLL type, same table */
        power-domains = <&rpmhpd RPMHPD_MMMX>;
        operating-points = <&trivian_opp_table>;
    };

    pll2 {
        power-domains = <&rpmhpd RPMHPD_MMMX>;
        operating-points = <&completian_opp_table>;

	/* other PLL type */
        completian_opp_table: opp-table {
	    compatible = "operating-points-v2";

	    opp-123456 {
	        opp-hz = /bits/ 64 <123456>;
		required-opps = <&rpmhpd_opp_super_low_svs>;
	    };

	    opp-333333 {
	        opp-hz = /bits/ 64 <333333>;
		required-opps = <&rpmhpd_opp_nominal>;
	    };

	    opp-888888 {
	        opp-hz = /bits/ 64 <888888>;
		required-opps = <&rpmhpd_opp_lower_turbo>;
	    };
        };
    };
};

The clock controller driver would then create a per-PLL device, bind it
with the OPP table, etc. The consumers would still vote on the resources
necessary to run the leaf clock, while the clock controller would care
about the PLLs.

You can guess, I don't like the idea of having voting tables in the
clock driver...

> Recently, some drivers (Iris, CAMSS) have attempted to circumvent these
> problems by holding a direct reference to the power rails and managing
> the votes manually, through placing direct votes on each rail via an
> OPP table. That however has a number of drawbacks:
> * Because more than just one clock needs to be scaled at runtime, the
>   OPP table either has to contain NUM_CLOCKS * NUM_RATES to handle
>   that (which blows up pretty quickly), assume the worst case (and
>   waste power), or ignore that problem (and undervolt the clock
>   controller), instead of just being able to call set_rate() on each
>   clock as needed

If the clocks are independent, it's a different question. I don't think
we have a way to describe that we need OPP table a for clock CLK_A and
table b for CLK_B.

If we need to scale several clocks in a lock, the problem is manageable.
We need 2x entries (at least for the typical cases), because we need to
have one entry for each MMCX level and for each MX level.

> * The data ends up being dispersed across various consumers, even
>   though it logically belongs to the clock controller, making it
>   absolutely unauditable

Yes... See the proposal above.

> * It's horrendously error-prone because of the number of clocks
>   involved, the depth of the clock tree and the fact that at the end
>   of the day, one still has to consult the clock controller
>   documentation

One needs to consult it anyway, more or less.

> 
> The approach proposed here also happens to more naturally fit into the
> process of how an SoC is brought up - clock controllers are always
> the very first pieces that need to be complete before other IP blocks
> can be brought up. And because of (1), enclosing the frequency-corner
> data within the clock drivers takes a weight off of everyone else's
> shoulders.
> 
> On a related topic, the GDSCs are modeled as children of *all* power
> domains consumed by a clock controller at once. GDSCs are on/off switches
> with some fancy logic attached to them and may need some (or none) rails
> enabled to power on or off while meeting the hardware timing
> requirements. Voting on them was never quite right in the first place
> and is once again only a side-effect of the clocks' power requirements
> not being handled centrally.
> 
> This series removes the vote propagation and the overly broad parent-
> child links, resulting in dropping unnecessary/incorrect votes that are
> now encapsulated by the clk-dvfs infrastructure. Big emphasis on (1)
> once again.
> 
> The implementation is as follows:
> 
> Each clock describes the rail levels it needs at each frequency. The
> new clk-dvfs helper combines these requirements and submits the
> resulting votes through GenPD and RPMHPD. Votes remain held while a
> clock is prepared, and rate or parent changes reserve the new
> requirements before any clocks are reprogrammed. This also requires CCF
> to report programming failures and OPP to retry failed transitions
> instead of relying on stale cached state.
> 
>                 Consumer: select rate, prepare clock
>                                    |
>                                    v
>         +------------------------ CCF ----------------------+
>         | Walk the clock tree and reserve resources          |
>         | before programming rates or parents                |
>         +--------------------------------------------------+
>                                    |
>                                    v
>  +------------------------------------------------------------------+
>  |                                                                    |
>  |    GPLL9 ------> SDCC2 RCG -------> SDCC2 apps clock               |
>  |      |               |                                             |
>  |      |               |                         Other GCC clocks    |
>  |      v               v                              |              |
>  |  +------------+  +------------+                     v              |
>  |  | PLL's own  |  | RCG's own  |          Per-clock requirements    |
>  |  | rate table |  | rate table |                         |          |
>  |  +-----+------+  +-----+------+                         |          |
>  |        |               |                                |          |
>  |        | CX            | CX + MX                        |          |

RCG doesn't (typically) care about MX. It is not split between multiple
domains, is it?

>  |        v               v                                v          |
>  |    +--------------------------------------------------------+      |
>  |    |                  Clock-owned DVFS                        |    |
>  |    |                                                          |    |
>  |    | Prepared votes + temporary transition votes              |    |

This can quickly become a lock dependency (and lockdep) hell. Consider
two consumers setting the same clock concurrently (heh, nice design, I
know). For each of the consumers we must make sure that there is no
AB-BA voting update, which means that the whole sequence of
pre-set-rate vote, clk_set_rate() and post-set-rate vote should happen
under a single lock. However under the lock we vote for genpds, which
might trigger other transitions or, in the worst case, wake up the
domain.

>  |    |                          |                               |    |
>  |    |               Maximum requirement per rail               |    |
>  |    +-----------+--------------+--------------+--------------+      |
>  |                |              |              |                     |
>  |            CX voter      CX_AO voter     MX voter                  |
>  +----------------+-------------+-------------+---------------------+
>                    |              |              |
>                    v              v              v
>        +----------------------- GenPD ----------------------+
>        |      Aggregate GCC votes with other consumers       |
>        +---------------------------------------------------+
>                                   |
>                                   v
>                             +-----------+
>                             |   RPMHPD  |
>                             +-----------+
> 
> Straightening out all of the above lets us tackle another problem
> with the upstream description of the power grid - the dependency
> between various rails. Most notably:
> * CX does NOT need to follow the performance state of MMCX

I think this depends on the RPMh translating votes or not. Is it really
fine to run MMCX at turbo if CX is at low_svs?

> * MX/MXA/MXC and CX are co-dependent only on some platforms (in coarse
>   terms, SM8350 and before)
> 
> However, the main part of series needs to land first to ensure that
> dropping those relationships doesn't remove some wrongful votes the
> system relied on to stay functional. Resolving that will save power and
> finally ensure total stability as far as the providers are concerned.
> 
> SM8650 is used as an example in this series, but the conversion will
> have to be done for all Qualcomm platforms. That will follow soon
> after the patches are merged. DFS clocks are left out of this RFC to
> reduce noise (the remaining diff is not particularly large but also
> requires boilerplate changes to bus drivers).
> 
> dt-bindings changes are not included since it's an RFC.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
> Konrad Dybcio (16):
>       clk: Propagate rate programming failures
>       clk: Acquire resources for clock transitions
>       OPP: Retry failed default single-clock transitions
>       pmdomain: core: Support named indexed virtual attachments
>       pmdomain: core: Support subdomains without pstate propagation
>       pmdomain: core: Support indexed power-domain attachment lists
>       clk: qcom: Add clock-owned GenPD DVFS aggregation
>       clk: qcom: dvfs: Add debugfs
>       clk: qcom: clk-alpha-pll: Add DVFS (un)prepare
>       clk: qcom: clk-alpha-pll: Vote for the PLL calibration frequency
>       clk: qcom: gdsc: Make GDSC parenting optional
>       clk: qcom: gdsc: Link required power domains
>       [DNM] arm64: dts: qcom: sm8650: Describe clock controller power rails
>       [DNM] clk: qcom: Enable clk-dvfs on SM8650
>       [DNM] arm64: dts: qcom: sm8650: Drop required-opps
>       [DNM] pmdomain: qcom: rpmhpd: Stop forwarding MMCX pstate to CX
> 
>  arch/arm64/boot/dts/qcom/sm8650.dtsi        |  62 +--
>  drivers/base/power/common.c                 |  24 +-
>  drivers/clk/Makefile                        |   1 +
>  drivers/clk/clk.c                           | 793 +++++++++++++++++++++++-----
>  drivers/clk/clk_resource_test.c             | 376 +++++++++++++
>  drivers/clk/clk_test.c                      | 194 ++++++-
>  drivers/clk/qcom/Makefile                   |   1 +
>  drivers/clk/qcom/camcc-sm8650.c             | 282 ++++++++++
>  drivers/clk/qcom/clk-alpha-pll.c            | 317 ++++++++++-
>  drivers/clk/qcom/clk-dvfs.c                 | 635 ++++++++++++++++++++++
>  drivers/clk/qcom/clk-dvfs.h                 |  41 ++
>  drivers/clk/qcom/clk-rcg2.c                 |  93 +++-
>  drivers/clk/qcom/clk-regmap.h               |   6 +
>  drivers/clk/qcom/common.c                   |  28 +-
>  drivers/clk/qcom/common.h                   |   3 +
>  drivers/clk/qcom/dispcc-sm8550.c            | 328 ++++++++++--
>  drivers/clk/qcom/gcc-sm8650.c               | 261 +++++++++
>  drivers/clk/qcom/gdsc.c                     | 154 +++++-
>  drivers/clk/qcom/gdsc.h                     |   7 +
>  drivers/clk/qcom/gpucc-sm8650.c             | 101 +++-
>  drivers/clk/qcom/videocc-sm8550.c           | 135 ++++-
>  drivers/opp/core.c                          |  72 ++-
>  drivers/opp/opp.h                           |   2 +
>  drivers/pmdomain/core.c                     |  60 ++-
>  drivers/pmdomain/qcom/rpmhpd.c              |  14 +-
>  include/dt-bindings/clock/qcom,sm8650-gcc.h |   2 +
>  include/linux/clk-provider.h                |  39 ++
>  include/linux/pm_domain.h                   |  33 +-
>  28 files changed, 3734 insertions(+), 330 deletions(-)
> ---
> base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
> change-id: 20261001-topic-qc_clk_dvfs-ef907f059611
> 
> Best regards,
> --  
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
