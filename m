Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E070F378832
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727886; cv=none; b=GQZbQBMrvsz3HXfIJS5KpB07xS2EUyMei4cxPQfpPTuvuHMXyA9UdOlVAT3sLsQ4xFkAUczEHvK+u4h1qS6zZUt/o8FX9aZEGivr6BD2DnsYzP9MEqFrTlrjP2KepHJtHOKFikmoCyKNsXV6YydjzboF0/evDEClqZPe/7QPSpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727886; c=relaxed/simple;
	bh=KYymsWgZvfsa2Vf73oVvMIKmJDi/+uDmv+OT8hnk7hQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRJcH3guzwXv0ImpYSJtcyMMXFzseNvt7v5IatyiXKrfPFPilNk3qH2HqnXqDS99vtlYbYeQhGikpdgp9RrK6maj9BYaC9KQ27js1DCKAwjns+xF6kCCx9I3mMBrNDgrz4lbKpfDazDDe6ggrgrTIw3JUKdFs+popqzLeSboa3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nsbxWSzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIBd5K7/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nsbxWSzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIBd5K7/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T72eZP2164000
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=; b=nsbxWSzkWFVVwFOV
	3gs12zCZbydLBjJ2r+sbn7rO3cZF6yxBa4OwuwGj6pcZNodG3C7M2g41UnJlw+Zv
	vWQM0Kll7R0FtpiqllsdCEuGjqk+xLxJWJyfIz+HuRALmrzyFv7l6jRA/Lv4cHYd
	fjR3PrZ/fKAGVvOYpR4lFqgMUWIBifrDmF4pTzt4pqvWCaf+plRBTr+UGQlTQ6Om
	gnkcvqdNFeCPv00iz2FgQ9W2T/wWpu7NMLVhKEbxHm3GteE6n3Oeh8cZ6LSdpW/0
	kSGDgEdwNStdcRcwOjEFuc+VEWVUmtlv7sztbmtsIk6hwNdSpjg64t826l52gc1D
	1Pyn4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kyjgs8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:11:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92b79cc1f21so73201485a.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 03:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782727883; x=1783332683; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=;
        b=aIBd5K7/Yy11rgijDrSx9q6FSHl2pqSsEQjsjyKuS59jtOuF6I6lgySdaR2fiOacun
         K2O7Y0o9z1x8mdHUZMp+KQMKOHD6ddo1H/lommJKHXVpRe2ouvyBiyH+M+Z8IVR2gguk
         AGJG9J7WGGnbIb2YFLyyb80th9Spj0KLBMb8ZmlOPFvx3JR1QA8pIF0JafxedpsKU9/q
         cQCw19wl5O4khRn2zAno4nJ6PPbVBojioWQQw2tNmk+OtUj6bG1O4tjAugV8TP7eSf0S
         bZ4MkqdPBuEU4F+ACYfCiufYyNdTml10L3/TdC5nHl9MRyC0QK5VHoE7PEigQSlwFZdE
         Porg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782727883; x=1783332683;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wlXJMssS9Ms0Gy8FZlFlkBj6U2eJhiWyPzITidulEQY=;
        b=HGqcBIwspqjGoraHA2ItEw4Qp7+9e4QIj9pjWSAfq6bLUBs4V+okvk+CS713o4EiAA
         jSC5INMMUa4Zn2w4rykDw6wQxVRfzr/uyYFKamMZ1qDlCcPyBwNrpROnxEqVlR8R8izi
         oinV2d62VmjVwZYVar/Wll+V1CciQcX5NjAgymR5TeJREIUVidrERkJXC9mAWlbM2Ge2
         zbmI03V8rbYNhg3R9lJT1IO9H8vPq3rbIXY6oNiQIeHFGSAcx6pqc1BOT6W7rSpuIr3W
         izbySIs1f0F6veoaLy2v+8vwhSBWxKa/R62xnOdRoycP2RmvKTWttMlZl3KNXp6O1aSa
         AVPA==
X-Gm-Message-State: AOJu0YweU+SBTOsvuPadl0gTipuKEfq8MV2OcC+UkWMAKzuu19cZoB8q
	1TDsPwgRdZ3qWiqyyeJ2JDobHkHDERvxlnLXJpe5xSx54MKmCKsSea+S05sJkfFisCet/Xk++/A
	/o9L27psKOAYISnGdDWvIjQaig9F7Y6Bapw4W67JtQVJBLUQ64vvxoGa5LAPAtn+26w==
X-Gm-Gg: AfdE7ckhjlN06saedxaW+2CnlXDsyfYB8IOb8NL2GnOAiFlTCCpL6GPMqKQ0LMYbhF9
	IkVUitagI6ovJHIatH7T01RavsEh7GxEMM4DRxJCwbVSLffxDhY4kLYNVJeyjmMdY3xwd/d+6Yl
	b23xdMsWfc5pi1aHG9Nz+vK22+ilJDlKfuMQTw/YdxLHHlsAyF0ouBk0CMO2rGv6p87PX00VgsM
	D+n4GjqGXuaXf/Ky9n+HdSv4/1vUPNBatEWUoQEIJ77hSTwdKMq70h56HixQkkjVx3pbvsFY1pH
	vGyQd5Kd7EFa/RM5YyXsXQSatoBu4RTY1rVrXI8VhHj1TwVrgBbVXNYhC9E2aTR50Ap7YZsbITu
	O3bidSWpELT+A8Z56YVgR9yP37q9Jg2kHg0Q=
X-Received: by 2002:ac8:57d3:0:b0:51b:f9e7:7fac with SMTP id d75a77b69052e-51bf9e78346mr27350201cf.5.1782727883110;
        Mon, 29 Jun 2026 03:11:23 -0700 (PDT)
X-Received: by 2002:ac8:57d3:0:b0:51b:f9e7:7fac with SMTP id d75a77b69052e-51bf9e78346mr27349831cf.5.1782727882440;
        Mon, 29 Jun 2026 03:11:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12660ae60esm151121566b.17.2026.06.29.03.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 03:11:21 -0700 (PDT)
Message-ID: <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:11:18 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Xuyang Dong <dongxuyang@eswincomputing.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hhphzdG1YqHNQzyFZ3Z8cHTs1OlvIUYJ
X-Proofpoint-ORIG-GUID: hhphzdG1YqHNQzyFZ3Z8cHTs1OlvIUYJ
X-Authority-Analysis: v=2.4 cv=Ftk1OWrq c=1 sm=1 tr=0 ts=6a4244cb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=20KFwNOVAAAA:8 a=QSepnEzQFVSc_k0dkj0A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfXx+Cf5Brsh5HJ
 s3aTzAkKvUFmhhxQE313BUiEZwF9S4PRBYfcm3bFcaktM/ZupMnNQCgbFcmiQNjfvqaVD7wamtB
 QxANH2i5ASbixoRmVjCIjx9kTKXSUws=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4MiBTYWx0ZWRfX9WHJz1mgopql
 G39eg9shooqc/2HH9SCXlM5dWN0kN2htL6wf3ZLHeqkIhC/lfURieHgEnuklWBHZAOg2+iQg/xa
 KFeh/RdseEkb3JzZlBRyg4xBdY+jGbas4m1iGr6/7FuheyGZjDa4+uon/UaJSg2oL3GQ4nCSvxa
 Zueg8EhWYSk4DaT8GGVHgOSJUJABugc6g/QrndmkebBl8KlHK/oAvA4VfZiFE7aUImSzoQmhzjS
 VUgxw02Vh1Y/OosDHn6SXLq/XLOGUEh0/R4pP+JOXIrIzEPuq/zcDqg4Y0MjBpdhHfmyFLnQC2E
 LXQGQv32YU/GUqiIG/wMW8bOXt5HNJb4XFUiPDg7slqXr37WHeAx69YqbGwQPI/l744jQYHyIME
 hcWXhbZQ1HmRtqFFFVzeIed2eztvO0Qp5/w5iuBIIzB9iKBqlst/pEuqxXjVa30mXPnZ/1BxrOE
 x2Qq0mYFbhE9o/jDU6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290082

On 6/26/26 6:32 PM, Brian Masney wrote:
> We have cases where a device node represents a provider for multiple
> types of resources, like clocks, power-domains, resets, etc. We
> currently have dev_set_drv_sync_state() where a framework or driver
> can set the sync_state callback for a device node, however it currently
> only supports a single sync_state callback.
> 
> The pmdomain subsystem currently sets up a sync_state callback in the
> core framework, and the clk subsystem will setup it's own separate
> sync_state callback in the core framework. These can collide with each
> other on some types of devices that have multiple types of resources.
> Additionally, some clk drivers already have their own separate
> sync_state callback already defined.
> 
> Let's introduce support for allowing drivers and frameworks to add their
> own sync_state callback via a new function dev_add_sync_state() so that
> multiple sync_state callbacks can coexist.
> 
> Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-6
> ---

[...]

> +int dev_add_sync_state(struct device *dev,
> +			   void (*fn)(struct device *dev))
> +{
> +	struct sync_state_entry *entry;
> +
> +	if (!dev || !dev->driver)
> +		return 0;
> +
> +	list_for_each_entry(entry, &dev->sync_state_list, node)
> +		if (entry->fn == fn)
> +			return 0;

Do we expect this to be a valid call, i.e. should we WARN_ON here?

Konrad
