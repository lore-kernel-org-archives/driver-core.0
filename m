Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653757;
	b=r08x2vO/PBldjwhWZ89VALnVHNY9yQksjktcxtrYWeZCeTK9QuZdTzSP94nf4BW66Ulf
	 plWKSyi/JOY3wwInI6kCgvEwl/CfHxbCfIeCG8JEC7lcULpqbENhVARHoalRVPH4Ug4y+
	 N0nMzXBYmaI4had9mm1sCW/cXTTt2jHVAElw48KHWVFXk81iowtxdYReKQF7wUkokJNRN
	 XXqhh2I9HtTNn1zCd1RvnyipfA305m8tXpQ9zVnLFAnw6+QRnWRSBrwpZB3Etn2gwBiRS
	 r8cGUi7wQVogeRoZ4uNOysGrwZIyqZg3qeaexoYr4VEznr/03pA2bBux/D/dh4JdFLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
	b=Sg+PTotq0p1xE361y4b9/hQkkodilasZL43u267NcSqHf8/ehHEQ9VWrM0r5Z2onKb9w
	 OvwJyiSW5vA2bKJjSp4fK7Z/aYU2Za4S9Vo0ZUfbgKacqLm1kk80+AW6zq8n8RlHck4ND
	 UJoXcA6Y01M+xskjX5A/UcD1JypH8wcNTydM4Lhz/UtdayH9w+rj0vwyzEcSKcdnlvGC3
	 YmkyrqaSv/dS/dIyBgQJZJWz3MZ/CV14IDz7Y0MNt2p4slf9vHUh5Sr7+Iy7KYmibXd1U
	 VO5cuqk2TAetYksrxfw+C5fbba7oYHCPAfnWwZ62NYpn0vafndXyQue1RmfAnw9aiJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Ihgv/q3G";
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcL1Vdrq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FFD606A320
	for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 07:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FFD606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ihgv/q3G;
	dkim=temperror header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bcL1Vdrq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70GKP2516285
	for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 07:22:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=; b=Ihgv/q3G57uNVXCw
	80iLuQi0Sg1ExxGXzcaxYUxHWIj4JYmi/3xXoDzfYN0VxU7u1hxeKtNkVWvpwsOV
	ynM2+Q7N0zEjljMGsMg1L0Co3OmZp93hQayYb2snGv8sqHnoXT4ZmQ0ceGjuX8Kj
	J/zPd3fYkZaCk6CbCygkxzpnzE2HRDgmkDKHb8F31TKU56gWvFteFr/vyJuRPmOS
	2wJ7VAFbLzGJo2YjqdFfA8rywdG5wCJnRrWgC3IZhs8mpdGz0MhkHf9lVdsBLauO
	UJx+Gog8qKH53Fbut9RaZr4pN2Ufe/OCKcGjZYu6XjUBrcB/hmQrAW3aPoZnWzZ6
	qsIjbQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a97u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 07:22:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f3960dca5so46074485a.0
        for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792653750; x=1793258550; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
        b=bcL1VdrqWn86HIj/iKla50pOiNq50smkJpX3fJBmDicN7Bvht6EipHX6/uKXxnnnyL
         rqj9AlCoSUcx+ImzQABZ/BS7XnBPfrxTvuMl9Z0wFwuvjddQYTqHO5ukjCTCU4jpfW4j
         YhEbF3K8lFI7zf9stElsy2gqGK26/nsf33piQPj6cDJ9yF4qzKXEzKpR4NSgEFnjZqPV
         8kBaGqS6AdpVws7oRuyl8AOLkvmi7OX7bjUN14UkIEJHYB9jYSMuxgdvAtM/GKMnQ/pC
         G5NqB9K0PdEks7C83bfw16YwcFQHMSkIVQ97jVzGqH9IIfUQYPGRv0e8zGWhnp/kslZC
         yIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653750; x=1793258550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Sw0fczu+qUDWDbQNMKQmVBJWsUl3OKWVlqM6X4kK9Q=;
        b=pR+GKSRiImfnAmR02if4b5dplaVKGr9vQOb/8/+n7ObiZEv0859vx5Sc6QFiv/8Wq/
         loRLXqW0IKOxo+l5EHtiM/7SeeSvoI8IjvXmSoZIvX59CbT5qsS/bSstILD4plAGkoIU
         k2kW1o2ZnTfkZBsp/7ExouUAUQB5seZiM7USpR2cS/Eg0f3wturvTusWw8FDLOYjpEYz
         KCoa3c8PXT8ZUj7xkzoQKuVEs39IeH8ParA+xHCfo0LZKHJ1cf738vfEVZCcJ3dJtUj0
         tPosB0pTQM2j/9qQNZIhw/gEtFmMdLGjICgGTsI+n0bYV0n9TApvB91tj34GCN0l0Aie
         Y3AA==
X-Forwarded-Encrypted: i=1; AKwUvBy/UDN4gkOi4FmMv0EEABv0fqQ3/F8UNA1LTX8oz+U/UmL93t6IHuhZMenENjkA+h+Gp94ndP+Q9dgUgw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKCISSl6sRqA/UVb38T3TdPyHmhYJgC2mGYgg0TH/zxihEaoHD4
	EML6qULMNdE9TxS2Lf3nT+Gigll/jJHDcdPaMKzn28sjYJUAT/0iZJsltGuT+R+YLvK0oFncOy5
	4rgr5wIoRWZp30eQMdcYjMGXtj5L3uJrDcZOVk6Vgoun93uiBSamsy4liGKUq+fBIDw==
X-Gm-Gg: AYBFou0YiOAiCO/dmUwniKKrw49TN9CFIr2C0SuU/HDSwMrcfYbbyQJ1rRG/CqZVnDU
	pbmFL1XHiahRUwn4YzHepRSb1ucKaA/DdunIA1LKYgO/8G8AZ+ZjI32sbp2GkX8hI3WqkcmhU4n
	SFp+UW0YfbM8FxKPBDN620Gf8MQYxc9W+mxRSp/mvZLEWnjt4fMjynwVjGbKeQcooXU8Rg4wY0a
	93ScFRpctDB9NTMBXin7CB+iAf+mRm4h764I8X5qqX2G7R6/xkLiANKtCyDhD3Uo5AEVnr1OXga
	ybYC2BhU0mwUJ/lLg7L1A6CwMERmjnv729WiyXfMxk0a47u4TOGdAKu/oxi9S4HFq7F9ZJmrIqf
	0OMlqFdjjhxXmOe9D233ciQ==
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr923297085a.2.1792653749702;
        Thu, 22 Oct 2026 00:22:29 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:93f:1fc5:f07b with SMTP id af79cd13be357-93f57eedc95mr923292885a.2.1792653749300;
        Thu, 22 Oct 2026 00:22:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f29aesm77548366b.11.2026.10.22.00.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:22:26 -0700 (PDT)
Message-ID: <11d992ca-f666-4a4b-a511-ec12335e6960@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:22:23 +0200
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
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
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
 <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
 <3d8158f1-8c26-4866-a318-abaad47f75ac@oss.qualcomm.com>
 <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <njgant4vjdowkfe4milfhpeknosxxyalcfuf5p25c2t2sn6ffp@esokxr6ridc4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9b9b6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NNcpZA-_c-qG0gzoYGoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6VJWsAd9Gu4ye0P9jR522smsgNHd50NJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyOSBTYWx0ZWRfXwafMtJmiWLTG
 du0oYNk1zpYnDjx7O4q8y7SaqqJqKeqYPWmHK5q9utn+SiWLcJ/vFGyr0Nmz9lf+4NopaQ/sxfn
 JuT/ectNubM0a2omJPkhblnGecSIl9I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyOSBTYWx0ZWRfX6kyJRNEgRCsh
 LDicPqejBn8qEyk7uQcK1of7BytLvkTryTe2kQjg0qI1AesEDGb2Dycdp7pOOuWdZlykfhPfMWm
 BtP+X26PHDSQgTOnzsjWMNoSBxYQGk4Lfs4+jo0N78CuvobGsfHw9UZJ/3vwam3o6udHL7KzcZW
 LLXK3Ty47Ds3MdhqEddxzghUHv1HlF7ElTvoDB2hBKZObVZhlt9GahaPTZks6VuO/v+al92wT7D
 exEfg3bcH78g1qhbpveju2esI9knP9klAkyGYGSMzLR0Xbcz/HCwNUtI9zEhKTvPs9tNCUX+YbC
 LXrmoAvVcZqXCpjIKDRN2PNonau4sI41wfGLssG7aWDvj2K16iLXckMjSRJDwte8+YAeU+H3eO6
 5nDcYbISR96nzoxAbPrVIfQVui+bZ+nGq1G69nIxOPAiSRg0As+SsyFDrEIabUewY3trK9Z16rw
 shGJ6ZYK7yu+PEfmDnw==
X-Proofpoint-GUID: 6VJWsAd9Gu4ye0P9jR522smsgNHd50NJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220029

On 10/14/26 6:32 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 06:14:43PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 3:35 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> A failed OPP transition need not leave the clock at the last successful
>>>> OPP's frequency. If hardware changed before the error, the default
>>>> single-clock path can subsequently skip a necessary retry because its
>>>
>>> What is a necessary retry? Shouldn't it be: try, rollback if it fails?
>>
>> The failure scenario is:
>>
>> opp-table {
>> 	opp-400000000 {
>> 		// low
>> 	};
>>
>> 	opp-1000000000 {
>> 		// high
>> 	};
>> }';
>>
>> 1. The device is running at Low. OPP caches 400 MHz and the Low OPP.
>> 2. A driver requests High.
>> - OPP raises the voltage to 0.95 V.
>> - clk_set_rate(..., 1 GHz) changes the clock, but returns an error
> 
> I thought that your previous patches actively target this. I.e. if there
> is an error, CCF should retract the changes for as much as it can
> (assuming that there is no extra error on the reverting of the clocks).

Right, that's at the CCF layer. OPP also has the same problem and
needs a similar solution. Perhaps once all consumers are migrated
to clk-dvfs this won't be a problem anymore, but that's Qualcomm
only.


>> - Assume clk_get_rate() can report the resulting 1 GHz rate.
>> 3. The transition returns an error, so current_opp still points to Low.
>> 4. The caller tries to recover by requesting Low again.
>>
>> Perhaps I should have included that in the commit message.
> 
> I think, if something changes the state, but returns an error, it's more
> or less... an error. Or a bug.

As we've chatted offline.. you can try to unroll.. but if you error
out while unrolling you have to unroll the unroll. And if you error
out during unrolling of the unrolling...

Konrad
