Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE11346E47
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995592; cv=none; b=UfOu9YcOeGFFxLsPdNLJSNi7HzhqdDSwa7LkHh/K6KMfcq+fI4JpsZY+7t9Iy/YrALZgE0+ggvuhtnKHgyLh6W9HSVoIMOOgd92p0efCJxHXVwLQDA7/R8w1cNnLLoeDnlMw4IJW+uHU1U//RxTTicTJrwzVgQFkoRey3hnGF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995592; c=relaxed/simple;
	bh=2SmqRSM29LOzHM3A6GRo5sG3zBqbZbnVlToBp75cpZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UADa2p6NunoLB1oillyfJv+F+ItuIWxKL8N1nbxQP3A+e+7gs43tdUHmeRwgQhVG9zV7Bmg910lwjYsSo5yjl1Fdc5Y4ghWwBKYAxy/lYORT8h1Kw+CYZSUgwZI/V+k2SmAR8a+/ncd9moP4HZNZN5pMLSZDWqf/VrArnOeco90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SqiTDsgd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bxYLBRy4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SqiTDsgd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bxYLBRy4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpa7e1672215
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Y1mP7tjz0hdlvUiRGJ/PYzkP
	s06b0Qc31Vf6gKT+zak=; b=SqiTDsgdAMLlg/VmmNIgi64kqSNttKz2JFT/JQps
	iKksROTi5LtbCb1iExe4VZisxmOjTXSc5qY3t8AzLdITJfAWlerr7dcHOC7eEINz
	sF+ScAitxzJlBP1QjlE2/AkCuvXB791xdhi+ZRCGaDPfUEb7Kkl1JGTDQViaSbhL
	So+U+1rVlO/FkoV7beVyz6HNoB7BDuEj9LpMcYxEHGkxAglspqlQLp5RUzQG4kJx
	IODHbTrUuKVWZkivtMbvTOvjkYg7XBYPRwNU1zIP5BB4YdPKfJIYFIC5ujXoj5Fk
	f8sCBjpJ1c9AiSNNLdA2u3LwWLF6/0xYFgX5cT4uxHl88g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh85qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:33:10 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98ff6ebea68so268919241.2
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995584; x=1792600384; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y1mP7tjz0hdlvUiRGJ/PYzkPs06b0Qc31Vf6gKT+zak=;
        b=bxYLBRy47lTbcIvujl/1amSMzp7nI58jhMOQEzNV/O63+iTgKYhtodXq6d3hS6qX9G
         i+O9KAlNyojr1A81XETaRzHPzxyU1PEmgJWV/qQ1vpzHb35WBRHNC7tK35iGxyIwS8or
         WPPjfcyLR4hRoeeMP60WelK0yyz96440aFLETOB1q8iejyggyiYLcPM605xqV1mIozPU
         1DnFdJ+7vYggr+K1PUJg0TjwYQvCvM4pH245VQfgJ1R623HSxSHn9uUJEXjzNc5hegma
         mS5QCUCMDxXctTFfn1hbqVRccDMESXoZ6xbquuPCRetB8aT0LTeX+R+2Kl6eNDE+e7f5
         tjvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995584; x=1792600384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y1mP7tjz0hdlvUiRGJ/PYzkPs06b0Qc31Vf6gKT+zak=;
        b=2aJuuLnyg+bVhpqZy2pZxgmSvnu4UhNuZJUaXqL1hqHH/XRWQ3becJBiZwxMU3G1YC
         GzNm/v/0ouuILpExvSBr/qdfc++k7geCzLWGE1tofGuZrNMkDtyUW5Q6eDO+j9dg11dN
         KbmnBJKXi2gQTYPLjMNM4UrVKdoPDAY4mhcZ/YSKOPT6EerMbWU0ct4OZ2qVTBOve70X
         LutmTCjNGQ9n+Km3h0aZYawGFDajnIYaZqIRE3eYHkD0xCG1HtkAhXiYkmhBQq7MtT+a
         kUucK4RvZ8CMwbTS7BFSoU3rAoPtqip1ekJajHDSVrEIp0QfCs25I6fFXr7Uwl5OlQcB
         +vtg==
X-Forwarded-Encrypted: i=1; AKwUvBxTtoDs6XZ7N3w23a5aVOnfO3DuINYc+4VTLbQgQkz3cz/WzS5MKeAGmbU2dOFLDFEHIpQYK7VZPQAKGA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIw7vZiWN+oKNtN4OkSl8u1QHGkU9wQiz2tiKpvgvX7u3jmdkS5
	rSXBH1RbFTcBrwvL5/qTS4iJsJccsMsK7f3eP1w1FUjJkQ9Z7+8AGUDwBxBGgTHNddTNCSDsg5j
	7/rvxVra3VJN7ZofuTledKCnV2ZPtj8iyhqOw1jNFXUxgN+BEGHjUD84wkZ8Pib/5AQ==
X-Gm-Gg: AYBFou2KE3pXXnHURt4CMALeK00gV+gbSMgYEph+GKNK2m8tk6ZzSrvSxOhfPd28Hw/
	gtffnHGl02k3tyBHqXDDjtqI/mYSfmM0kUogMs6JuYwq2aM2h7xbhFAfoNdrVoTpGDGhLN6PppY
	QUEJjQ2xH8axwsPqcNi1UNRaEjQOULxEZMRCc/Y4MRzR4fwv9MZqWuzvn+MpUgQ4/9FPRqxdvoP
	0Dqf0eXdlcFe87FHvcKB56aMh2abVTnIiXgsWQMtMH9czGzscsn2sdXhsBrfvBe4ZNUJONDEZvG
	mriNLKoKFCob4jidIS0E4S4dbmRSkeB0C6AmLIJo2sYyQHRDr+d4pm8V+yDnnpZPNPPRfPWeYgr
	jUEmrAoT/HvGRTe9n4rR+Vxgsz9eY71VFBHQ49bfTvQMFIGNGAhp9h2koEtFQp6jpOfTabohWgv
	4GWXplRwi43WSk
X-Received: by 2002:a05:6122:20a3:b0:5c9:c60e:3a44 with SMTP id 71dfb90a1353d-5e91f5795e7mr4855536e0c.22.1791995584462;
        Wed, 14 Oct 2026 09:33:04 -0700 (PDT)
X-Received: by 2002:a05:6122:20a3:b0:5c9:c60e:3a44 with SMTP id 71dfb90a1353d-5e91f5795e7mr4855515e0c.22.1791995583701;
        Wed, 14 Oct 2026 09:33:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93e00sm758352e87.66.2026.10.14.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:33:00 -0700 (PDT)
Date: Wed, 14 Oct 2026 19:32:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
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
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
Message-ID: <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
 <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RcEhclCcLHva8Xz23P30vGt8K-ij5wRc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX9vEL+gUizayi
 hdRCSwUp6KLFLU5SsuI2jvZ4kQHdXw3ajTnJD9e1NXgFIE+AIzu+UIKK7F29FOov2kNdK64mCsb
 QgFedVj8rnMxXaABIFru4Otpw1japc0=
X-Proofpoint-GUID: RcEhclCcLHva8Xz23P30vGt8K-ij5wRc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NSBTYWx0ZWRfX2r+DfG8ZhULw
 FQYqHKbfFoE2hgxz6hdSeO3XyLL7sjuy7igEexneqjA0FslR9fpcpiSG8tpGnRrhqXORr27ydRd
 64Mb6iHB2Ny2+blDmVtaPWJ8mYwUrmREulLiUFPABocqTGMajrzkOouv4ZYQujwBCbvVPdgol5t
 t3gEhyNeg2JI2E3hQcRoA+zWLYRvwG67nY1eUiIhnElhLg4zKl0nWHlXn7PGDKkCwg9OijAg4WN
 x7zGDPvatKtq1Nxnt4AtBQnkYG1wcOGstV81dSK/iMAcpsGsqzA0CDxNA+BaRYMkebNB/5S2ngY
 AhIGYBjFOR9JZtRKwuO4uN4t1BIE8D/DLxOwMeU3qOw7VYZ5N7nx11Aq5vlLl5jITT3G9PFP2fg
 RWgPQC2TJNmgU5rf2tHq6KMF8CMwru9ahqQBZrEumRfNpUXPtB7nG8KSXs7yUpszsM6oOATUC2v
 LQ9nxbjP8SjD6m/GDWQ==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfaec6 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=q1GH_QlswVeDWWcc61IA:9 a=CjuIK1q_8ugA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140065

On Wed, Oct 14, 2026 at 06:14:43PM +0200, Konrad Dybcio wrote:
> On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> A failed OPP transition need not leave the clock at the last successful
> >> OPP's frequency. If hardware changed before the error, the default
> >> single-clock path can subsequently skip a necessary retry because its
> > 
> > What is a necessary retry? Shouldn't it be: try, rollback if it fails?
> 
> The failure scenario is:
> 
> opp-table {
> 	opp-400000000 {
> 		// low
> 	};
> 
> 	opp-1000000000 {
> 		// high
> 	};
> }';
> 
> 1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
> 2. A driver requests High.
> - OPP raises the voltage to 0.95 V.
> - clk_set_rate(..., 1 GHz) changes the clock, but returns an error

I thought that your previous patches actively target this. I.e. if there
is an error, CCF should retract the changes for as much as it can
(assuming that there is no extra error on the reverting of the clocks).

> - Assume clk_get_rate() can report the resulting 1 GHz rate.
> 3. The transition returns an error, so current_opp still points to Low.
> 4. The caller tries to recover by requesting Low again.
> 
> Perhaps I should have included that in the commit message.

I think, if something changes the state, but returns an error, it's more
or less... an error. Or a bug.

> 
> Konrad

-- 
With best wishes
Dmitry
