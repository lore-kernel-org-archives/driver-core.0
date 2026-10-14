Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827F3C3F5B
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791994768; cv=none; b=g6scgc+nClxdN/ZTQKX8H/GYXL2u31DrFpfs6V49VPHgnD1CcEfeMXnFfdWR/xg0W2Si3O956wRYTejfnSvqUzawvj/OCZaAttxU0CKUPoCCLSb9kzdnYTmOSu2coID2Tt86zGkIIjgD0G5AaFCYwKY1/Poczt0ZpZv45k8OASA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791994768; c=relaxed/simple;
	bh=VvuCCW3L9C6hp9pEm/8Nbo63Qyzq2Vnkc2fkJGYU25g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fjfPjhgM8Lp86AJEruBCzhRxrZddDx/eh0NNfC7v+3OErhRfynMEfqKFjOssrwDv247O6NlYTHUSxD1RxeWKibryb2Oj4pj80piD9udLOgLZE8Wpyeb4JIS9RGWXRWBVK6K5nLg3bPbYwX4GSHtrAbns2y/t97QkFJa4jDzHldQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7lQkA1x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JVrH9o3X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7lQkA1x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JVrH9o3X"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEb0wJ905379
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CrJkDswpBhSYrFCKehirpfj4EkMnDagDxpSrCNh5Eng=; b=F7lQkA1x4/D2QRIf
	T6b4YdXS9lwYTJeqr+0P+V2+Nu3uhidSasA1L3Jl7ty5PcyA3kjAcsD3hPnbdAp6
	/SCtHbe8hdRtPkUYc2/7e2Q90U3aisFraLkJ78Yf7EKeScyU/EUyasYdBlmzrmSD
	uPj3GXvLqTynyrcUGyTuRKloOFRVLm5dmK8Aue7NkiKaE4W4pegqRhRUD1Cvzpz8
	csniWQeP3coqjY0LwN0VRkLKDXt9LKejrax4z5yGkRm8kZKOCcmPd159gkFZcngL
	/HJuaLaI0kgStCsPm4ZsrRfcUAOPrw7QP3MjeVqnVioJVe1MzKZ9REkhX6AK4Z6j
	a5shWA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p2gxw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:19:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea15d721so50639885a.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791994765; x=1792599565; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CrJkDswpBhSYrFCKehirpfj4EkMnDagDxpSrCNh5Eng=;
        b=JVrH9o3Xz3qFrVvmvdyvV5lQKvm7+u3/poc2m8Qn3eKK1ZWq0B7PSUy44B0KQdnoyC
         g6z+ZHPB2fnVJl1FJyTbdm9SGviPpxH+kZlQc2mz7Qf0fT2pGQmZKfwZUst8oYCA2CEc
         r5g/cFer4OTuXTS0pAFD0qTL+AsF+ZA8VEWnRB/F78D9CWqPmUV1JNG1LXrwxgK5cAiz
         F1I+WJLRZu4ZN6X9peFPfPNbHOE+WOJ3HySe35dwPgK7vdQo06wHxY6q0qVNu9nVQ/3O
         T12dKqLkMv8pDAPVNrB+AhK/3Xu6OF6OxyeGJkyHl2tvCmAx0n6kC7DlzdUWqdQFKOWO
         keBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791994765; x=1792599565;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrJkDswpBhSYrFCKehirpfj4EkMnDagDxpSrCNh5Eng=;
        b=zVo0HWksdl00Y3YsuRqcR38kYWNtHwaSHtYz6jgxnuFqfarVvAgUoZKmER9yRjI6wR
         nzNT+FvGx2vKkQbv2wQBodnM11vv6E7uyr9zj7OcQ5nv1He/z1K9gbHOJFvHynkuz9B7
         pcbO5mAyaczd1PkehlBCrc5TrxmOdnE+yiL3ODHY0gkqhDzw+HK+1tg8gU/e/8566Feo
         2k5OTB8D6KJbkghnQmcZ0Nshoi/YJN/AkCZME3ngoVzghLjUmPQa0h6a5nQrpl0uYt4c
         vMUAyZURLrrA+godOW8xRVY+iSQ2rYqNw6nNdPUbh+0VYy8M9syoHfGWQj2R7xUDvc4A
         l3YA==
X-Forwarded-Encrypted: i=1; AKwUvBxgSdBr2X50ZIVHTPd9H7sJYY3k7w5Cr6yL4HebZQSxd+j5xyTGVf1A65cR0Sv8WTPb2fJg/jZ+gtutIA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJmsja0q5wVu4gVtpqU52ei1eguLGNZ31L5TnP4S8QWTP8wH/Z2
	F7gQFgBUkVGpTg4JFOohkKG348Nw5j/v4bxw9zfimbN99gFDCa676mISxpK61qO9j0mYaYGiF7F
	AVgerT1Sa06VSQ62na3NnMBQIHYDYiwdQvMyYa4kZO2i5rlUm1G9wppbxnLNAkq9ZHA==
X-Gm-Gg: AYBFou2T3Vk2oeMoJUMPn7IQuFm56eJIXpElUgw+PAjahfG3li62m14Ryo2qsjpf96B
	kTittkjfi1r64qg6Fj70SBurMDdzrpWb+conr7oGJJ3JoiBctwGOG4cKtcRoNCr5F0DXAyUeYV2
	kmrPk04YU2PUGmz7dLXi2/FtTvg1hM8Bw2siopYC3GD9ZDp0SkoVlc0rffZ1OTck7YRYODecKxY
	s8msOTteXHu8dDWa/GPmjGkYaFXn5e0AKDG2BI8EVSJSw+Bg1YFmoPOJsk3eKSFo5Gtf6KX+ns/
	65L6h7c3NkGyEVjRpQQPVrLZK6lWAkEDMRwPy6YkZTvgi8E1paiJbqrx/pQgS8ywNe1SRaaRxEU
	F8vk4dKXxm0yA6VWDKvXn9A==
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2986075485a.3.1791994764931;
        Wed, 14 Oct 2026 09:19:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8084:b0:93e:571e:94f0 with SMTP id af79cd13be357-93ebd1eabeamr2986067685a.3.1791994764406;
        Wed, 14 Oct 2026 09:19:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3db62sm2581466b.36.2026.10.14.09.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:19:23 -0700 (PDT)
Message-ID: <02401679-2767-4365-927b-bd5ad1511d22@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:19:19 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/16] Centralize the ownership of power rail votes
 for Qualcomm clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
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
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <bpaaeh5bs4cw3tnk6y42gspbodciamak5mwjgtihlllduws4xq@7qd3sor3ic3o>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <bpaaeh5bs4cw3tnk6y42gspbodciamak5mwjgtihlllduws4xq@7qd3sor3ic3o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX1DJvPWA5xIE1
 pcAJg8osrNY56Tm26KmJXViUQkH9ZPi2FGgV1qN12Tpoovq1yQijLuGZFoUgBRYoFOWbmk3FNDH
 MdWxRB1cCw9X5ShHTDMrGQZ0JTi5xZE=
X-Proofpoint-ORIG-GUID: EfxHbQeWoTSs2Ha3Yz0MVaoUl-SJ6fQI
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acfab8d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JrKXcb0r65dDEwPagcYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NCBTYWx0ZWRfX7pjj3CTAfeby
 eNdwAJJ23yTlZH7PlJxCbpX0x6un8w4tRYaeHFpR/5zjA7X4NhBzf6thPYN0IyispOKY2CPjCYQ
 XDurE39SJ1xoL6ngGoMVpikqqr1omJitCG6EOBHxq72CtwvHhnuWYgnR5ZC50Ylm29PKvHLwrMH
 XLZAD0v+pJ9o6NG2/7UP6LWXub+crn41HTM3AdmdFX/7lkeESUn6d6a4AGsTFZFDOUIVch8TkO9
 TG/B9JbC9PfzorMEZB8oUKHB4f0Pl85oBAu+t5u7z3XUU9AYxdLSZoKVvZ010jfLpBTGAqiUxjF
 jXa0FmUL1exxI757084FZhaLc2JNwBgy/Q+vZUFkzLKflRX0m8DKfIN6/yNMyYVVqJX7dLVYNKT
 NGQxmBkPJ/m5UlP7f0Nr1WZuep0qH1aP5LyyYMXuX8wXpIXstl7nVRpu/JYRM51lDPBDytAcCtC
 J+Q4H2sU/M2KkX9DtqQ==
X-Proofpoint-GUID: EfxHbQeWoTSs2Ha3Yz0MVaoUl-SJ6fQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140064

On 10/14/26 4:37 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 02:19:00PM +0200, Konrad Dybcio wrote:
>> On Qualcomm SoCs, both the PLLs and other types of clocks alike require
>> specific voltage rail levels to operate in-spec, but through the
>> separation and decentralization of clock and voltage votes, these
>> requirements are often not met and are never explicitly stated.
>> This results in clocks being undervolted, or at the very least a state
>> we're unable to reason about.

[...]

>> To illustrate the nuances involved, here's a couple examples of hidden
>> dependencies, as found on SM8650:
>> * video_cc_mvs0_clk requires LOW_SVS to run at 900 MHz, but the
>>   PLL it sources the signal from requires SVS (higher corner) to
>>   produce that frequency. Similarly, to produce 1140 MHz, the clock
>>   requires SVS, but the PLL then requires SVS_L1.
>>   Analogous story for mvs1_clk.
> 
> Is PLL a part of the the same domain or a different domain?

The same.

>> * gpu_cc_gmu_clk requires MX to be at SVS to output 625 MHz, the PLL
>>   requires SVS_L1 to produce that frequency.
>> * A number of camera clocks follow the same pattern.
>> * Additionally, some clocks like cam_cc_cci_{0,1,2}_clk require
>>   MMCX to run at LOW_SVS, but the PLL has the additional requirement
>>   of keeping MXC (a wholly different rail) at SVS_L1.
>>
>> There's a broad agreement that a consumer should only have to care
>> about the clock it consumes, and that configuring its parents is the
>> responsibility of the CCF. Requiring the consumers to care about the
>> above cases (as is the expectation today) is a clear violation of
>> that contract.
> 
> I think that the conclusion was that the consumers should care about the
> full set of supplies they need, which includes all transient and leaf
> supplies.

Right, and my argument is that it's impractical and effectively
impossible to enforce and audit.

>> A clock controller may have on the order of hundreds of clocks, each
>> one with its own frequency-power map, and potentially all of them
>> could be similarly affected.
> 
> You have described several cases, where PLLs stand out, while the rest
> of the clocks are typically more or less in line. Would it make sense
> instead to solve the same issue in a slightly different way:

[...]

> The clock controller driver would then create a per-PLL device, bind it
> with the OPP table, etc. The consumers would still vote on the resources
> necessary to run the leaf clock, while the clock controller would care
> about the PLLs.
> 
> You can guess, I don't like the idea of having voting tables in the
> clock driver...

I don't think the PLLs are any special here. It just happened that
the special cases involved them. If we had OPP tables for PLLs, we'd
probably desire to keep *all* of the data in the DT (so also for all
the other clocks), and i don't want 50% of the DT to become clock data.

As you can guess, I don't like boardfiles in general too, but I think
containing that in the driver is the right choice here.

>> Recently, some drivers (Iris, CAMSS) have attempted to circumvent these
>> problems by holding a direct reference to the power rails and managing
>> the votes manually, through placing direct votes on each rail via an
>> OPP table. That however has a number of drawbacks:
>> * Because more than just one clock needs to be scaled at runtime, the
>>   OPP table either has to contain NUM_CLOCKS * NUM_RATES to handle
>>   that (which blows up pretty quickly), assume the worst case (and
>>   waste power), or ignore that problem (and undervolt the clock
>>   controller), instead of just being able to call set_rate() on each
>>   clock as needed
> 
> If the clocks are independent, it's a different question. I don't think
> we have a way to describe that we need OPP table a for clock CLK_A and
> table b for CLK_B.

Yes, they are! The AHB/AXI clocks for example (at the very least for
camera).

> If we need to scale several clocks in a lock, the problem is manageable.
> We need 2x entries (at least for the typical cases), because we need to
> have one entry for each MMCX level and for each MX level.

That's already solved today, and as you said that's just a different
requirement.

>> * The data ends up being dispersed across various consumers, even
>>   though it logically belongs to the clock controller, making it
>>   absolutely unauditable
> 
> Yes... See the proposal above.
> 
>> * It's horrendously error-prone because of the number of clocks
>>   involved, the depth of the clock tree and the fact that at the end
>>   of the day, one still has to consult the clock controller
>>   documentation
> 
> One needs to consult it anyway, more or less.

Yes, but provided you have the data, with this patchset, you can look
at the known single source and relay its contents to the known single
place (the clock driver), letting the computer do the path traversal
and max() along the way.

[...]

>>  +------------------------------------------------------------------+
>>  |                                                                    |
>>  |    GPLL9 ------> SDCC2 RCG -------> SDCC2 apps clock               |
>>  |      |               |                                             |
>>  |      |               |                         Other GCC clocks    |
>>  |      v               v                              |              |
>>  |  +------------+  +------------+                     v              |
>>  |  | PLL's own  |  | RCG's own  |          Per-clock requirements    |
>>  |  | rate table |  | rate table |                         |          |
>>  |  +-----+------+  +-----+------+                         |          |
>>  |        |               |                                |          |
>>  |        | CX            | CX + MX                        |          |
> 
> RCG doesn't (typically) care about MX.

That's unfortunately not a universal truth.

> It is not split between multiple
> domains, is it?

I think the most common case is "RCG needs CX and its direct child
branch needs MX at the same level" and the generator ends up treating
that as "RCG needs CX and MX" (which is totally fair). But again, RCGs
sourced from MX is also a valid config.

> 
>>  |        v               v                                v          |
>>  |    +--------------------------------------------------------+      |
>>  |    |                  Clock-owned DVFS                        |    |
>>  |    |                                                          |    |
>>  |    | Prepared votes + temporary transition votes              |    |
> 
> This can quickly become a lock dependency (and lockdep) hell. Consider
> two consumers setting the same clock concurrently (heh, nice design, I
> know). For each of the consumers we must make sure that there is no
> AB-BA voting update, which means that the whole sequence of
> pre-set-rate vote, clk_set_rate() and post-set-rate vote should happen
> under a single lock. However under the lock we vote for genpds, which
> might trigger other transitions or, in the worst case, wake up the
> domain.

Lockdep didn't complain on SM8650 and Glymur. I'm assuming the only case
where it actually matters is that if the power-domain provider is
suspended and needs a clock to turn on before accessing it. But that'
not a problem on Qualcomm platforms and that case would have bigger
issues anyway..

[...]

>> Straightening out all of the above lets us tackle another problem
>> with the upstream description of the power grid - the dependency
>> between various rails. Most notably:
>> * CX does NOT need to follow the performance state of MMCX
> 
> I think this depends on the RPMh translating votes or not. Is it really
> fine to run MMCX at turbo if CX is at low_svs?

Yes, that's actually the reason MMCX exists - so that the multimedia
power is wholly separate from the main rail.

Konrad
