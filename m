Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0DF47B425
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051739; cv=none; b=ST85WoKJNme4wmhSZUdtxUCqxEUxY80NBJdgzVxaefi3l7t2gg86VVhln/kSAlLfOML771dnzidDudyC8Ayevzm4CkfnG4g0S8+U4DS9RgPcjXRnCp5MpmWJ3y7OnOCvVfgjFi0bTHG129B9PoV7+RSjGQP0ucwXMMo20bWzUEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051739; c=relaxed/simple;
	bh=45PV67NtVgc4sgYoNCXN4H3us/yM8vaBVPcRzxk4TYo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QYGVa3ttlMK5D1TTJDt8Kp5u1Aa//7hBKe1849zEVpsGf76mgrzK/cVRTW9QMnnV8R1fGsnkjuA8AchwieKiLai+yU3xceghYFZnm3usrPfDDIYONFTox/jvAbR06v16RxkgAbEZ/aqnjK/jvjvatPSIGL0bzRU61H05a42YCI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Res8tA3h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jE1J+/Yr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Res8tA3h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jE1J+/Yr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F6XNIE586489
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 08:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VMnY2CqlgwWMj3YeqL6fccDpD4YzU58CT0eUffdDoHE=; b=Res8tA3hpKW+/v3Y
	qd9PdKElNkpfRFG8PjnPy5qMMB0ADXBDMqSZRbUDe1sOwIVOvbCX67jHZ1TAOrrw
	RqAjKI3FMEQithBfeOjNv/RhMRxP26sxxkReXOHuhIq6aGCQ0uoJho6Fx0EVfs6T
	sdG0/BMx5ARj4sY+0bUfCMKRIVhX8cZ1SKdmHYigHq+qqjypnRkdTsMNq248uC4L
	ZvbPtTOJZLcp5i1Ce8PHv/GsxW8JFNpGtb7zJcAmobbVCms9AAhHYc0OxAxHrb6t
	JUGriX+6tWN4YZwcBvzkwBnHRLeLdmmoHj0phFBfPBBlqPCVai259ulfyYPG8LVo
	DAGj5g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdesqbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 08:08:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53389750985so10316811cf.3
        for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 01:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792051736; x=1792656536; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VMnY2CqlgwWMj3YeqL6fccDpD4YzU58CT0eUffdDoHE=;
        b=jE1J+/YrBhCvyRxBcj+kD7dpeNMf0VemToAxj+40ldQmFoAX6bRrE0AaT4dC9UgK3W
         Hihq3ceytlxIf+rhN2btyqiGtniCLfOkWLn8qiYE1ztX2L+f11b76dSqYjBF7ZZeJa4m
         2/iBf5VdyhbAYRdT0wifEtaQpqh+rOkD/Z4gERIhuaEOz3S+AqZJ9Em9CoG2o2JVroF2
         S427jHg8v6DZwadBANYoV9J+XJ/S7JcIbzsvq92cOoojVOcyai9XTs/F/TpDBLSeYW3u
         kha4yhYJF09rchftBMNG2DQJa9MZXBW5h7qc/EAwjLljNSliIlfpevEopnKjVon3DNow
         CQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792051736; x=1792656536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMnY2CqlgwWMj3YeqL6fccDpD4YzU58CT0eUffdDoHE=;
        b=VqqMGS9IJBTjmmmxCDdhFlIWdHg5PePvfveWnV6nUfw7mac+jomjhf4I+6OvVzoa+Z
         UosHnpPF8f82JOSToLVgaOF/OYReTFXFi8Tk+Ueporn4pw4ZhIj52KBMr4Vff0RjH8GT
         fQ5COzH2y7Wq4xxlXhk3YvTaGFkyZYgPnqNNsObev702gbjhVc5mpRRJK0srSKAD31R8
         irAlfy9mLT3wsiSgVqtrVUkCtrdOSBBql1ChGnJ0qz2ETV+MnMj7PQD5n1DwowebstWD
         i+USzSMVH9ypy2IybGbzoaad0kEyy7nK6JbbNaeEh3R+u5/LuGlqZdX0wPyrL7t6zG4+
         Bi9g==
X-Forwarded-Encrypted: i=1; AKwUvBzDD3RpjJluRNzgzpRqO1JdEA3GLQpgd6EI2cTqLv1t7GrUclLQG0oQcSdNHNtJg8r3lMmOeivo14tRQw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJk8jkr7Xx65NX43ytPLImJF1/xrc+jH/3nh9NhQdJsE4UVABXE
	NNCkmq6h+8Idq+xQAUoAK56wJe3gGqH+LA2P6J3edyiApz5mL57aw+oISNCL+4tF71Q94Pgn6pu
	2t+2H/lGmNeC+5Bx5PYjqA4Rxtx9MeQzVC7FmWO0zVq9ywksAut2DRb5LAC7MI557kQ==
X-Gm-Gg: AYBFou2hkHJjsQu0IzCjngptJVcA0QZ2f0mFASGai9uoSELnxpfU4l7u7oNEPaLDfD5
	I1dQGUQhEMEIX4OAE3rIK1hWbom+pOLJB2sQhugezD8epeY1cqfY5yaW514EphzXJiPShmJMYPu
	RO7VyiSFgDkL1ebReSA3dloMXbWR/AGU2fUQYe1JItCe+aaXbsedBliZrYMkdGp4KBIkEg3YEYJ
	9eizmxq45PYCnFRltugki9ALt8pPPxK8nvfEFKr4jvTGc3CSVhdZ5eXNMfDj4xacrjzX/670Sad
	XOnOuRUb6OBMS/N4fgVK+2xD7GZk/+Ex8qUYlmxITyr6+8cJ/dG8Io7D9xbcx/tFfn3VaCb+Z+p
	Bk/PW9fmeW6aceZNwdjHx6w==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3390574785a.6.1792051735971;
        Thu, 15 Oct 2026 01:08:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr3390562685a.6.1792051733632;
        Thu, 15 Oct 2026 01:08:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963e0dbsm93441866b.23.2026.10.15.01.08.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:08:52 -0700 (PDT)
Message-ID: <47797de1-b50d-4b4f-989c-00ac2427d40a@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 10:08:48 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/16] clk: qcom: Add clock-owned GenPD DVFS
 aggregation
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-7-3041b788e9f7@oss.qualcomm.com>
 <ygwhik5t6w74xcqz4igmb6t5esmjjgrmtwqqqmo4doj34t7rpu@jkngx4v76rxg>
 <6c9937a6-88c3-4e5f-85a3-73d929d3ba01@oss.qualcomm.com>
 <dbyuabhh3phhe3uq2kvhcnuem7qb2a6j5yvhl6ylizqikt2rlk@vyvrcj3lewtp>
 <dad15717-4439-41b7-8552-0176c9cd1505@oss.qualcomm.com>
 <ussxpger36nwnvuqv4nmtogxkrn4krogw254qbtusdf7y2ofn4@pswnav4mz6lm>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ussxpger36nwnvuqv4nmtogxkrn4krogw254qbtusdf7y2ofn4@pswnav4mz6lm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad08a18 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tlWqZDqU6_vpIpeepkAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: bA0zrvjpER5_ZcXX222RQJZhgCGO0G41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzMiBTYWx0ZWRfX7eocPzCxJI4K
 9xztqor5mKKdEomM8DnRQ+US0Qgnc0fEDjJQ/SCJZkgUIEOgQGX+iKetQ1BGYvgXV/esYwJp7ho
 JTwiHqE54qf1k2o3wzR9tPHc1UPsBKW4Si13QBqya/jUTU/spezFLzfMRWRqR1kNx5vzH9cAMGA
 Wi35KIy64q05uNlJ9pSCRuEx+UMvaYPIVHSxFfHj9teK9YGQVWWTfD9BJZ5EXylltAUe7oNtHph
 W2aWkzST+46RJLbM0ZpW6hwZHgjykmGfpiXJFq4uykLAZaWb9U6gYxKtZp7zEYX+SU1PeO6q36+
 jAga8Pv++cztm5xgxll9VXf58UTol+Oo8okjyDPXzXGdOEkop7CICYj2Ahc90N59q6yud/iXE1j
 gbP8ZODhErSEmOvSdWCLQVKiOKNeQ18nhDPM2dtnt2+XqQHIb7B/MDNJaIz1Q1gWO6crQLQNpo0
 DKXDBD9eTrfuQbT0u0Q==
X-Proofpoint-GUID: bA0zrvjpER5_ZcXX222RQJZhgCGO0G41
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzMiBTYWx0ZWRfX053ztfMTyOH2
 4zCFzyRy29TC8SnT2iF22ZQDygh0k7HrnszYaVMF/vAD5njUJAub1VgZvDgfHl1PF3ExCk8AAW3
 Xg/XW6MNmzNEojmgmZyUus8xR9PO4UE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150032

On 10/14/26 7:31 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 06:45:46PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 6:30 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 05:26:00PM +0200, Konrad Dybcio wrote:
>>>> On 10/14/26 4:36 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, Oct 14, 2026 at 02:19:07PM +0200, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[...]

>> Right, but the meaningful difference here is that the consumers
>> only know they need a certain frequency. The required power votes
>> from that don't stem from the consumer's requirements. They stem
>> from the clock controller's inner workings that are necessary to
>> fulfill the consumer's demand.
> 
> Doesn't Iris core also have "we need this power to work on this
> frequency" kind of requirements? My assumption has always been that
> those are just folded into the clock requrements.

My understanding is that is just an effect of the requirements of
the clock controller.


>>>> The Qualcomm case is easy - RPMH is *always* reachable, so the
>>>> pmdomain provider needs no clocks itself. For the other cases,
>>>> "patches welcome".
>>>
>>> Ok. There is a promise that I2C PMICs will never ever be involved in the
>>> clock / power tables.
>>
>> Or at least that someone who needs them will contribute a
>> solution to this problem.
> 
> I meant actual I2C PMICs, like PM8008.

Yes, I know


>>>>>> +static unsigned int
>>>>>> +qcom_clk_dvfs_aggregate(struct qcom_clk_dvfs_rail_voter *rail_voter)
>>>>>> +{
>>>>>> +	struct qcom_clk_dvfs_vote *vote;
>>>>>> +	unsigned int level = 0;
>>>>>> +
>>>>>> +	list_for_each_entry(vote, &rail_voter->votes, node)
>>>>>> +		level = max(level, vote->level);
>>>>>> +
>>>>>> +	return max(level, rail_voter->safety_floor_level);
>>>>>
>>>>> I guess you want to avoid having too many voters, but would it be
>>>>> possible to have one voter per 'signficant' clock and let GenPD itself
>>>>> aggregate all the votes?
>>>>
>>>> What does "significant" mean here?
>>>
>>> I'd define it as "using a different power domain or requiring a
>>> different corner".
>>
>> I still don't get it
> 
> When the consumer votes for a frequency A / domain BX / level cc, usually
> the parent clock (at the corresponding frquency nA) also has domain BX
> and level cc. Sometimes (like in the case of PLLs) it's not the case.
> The domain might change or the level might change. In those cases that
> clock must have an explicit voting (I'd still prefer OPP).

I think what you believe is the PLL case is actually more common - the
branch, its RCG, the PLL upstream and anything inbetween may have a
different list of [(rail, freq, level)] settings (I say list
specifically because e.g. the branch may need CX, the RCG may need
MXC+MMCX and the PLL above may need CX+MXA at various levels.

Konrad
