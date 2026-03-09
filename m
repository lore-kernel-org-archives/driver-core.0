Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFE8846A
	for <driver-core@lists.linux.dev>; Mon,  9 Mar 2026 15:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071189; cv=none; b=WRBRb+Es+HNykjRGHxPUMViSIJcZz7DqUZ+H8iG1aHCQIm6lky0qOej/+FICUJZKtfLMpek+x2MTwRHtiRMUrFbCzvP+yY4uopFavAjtx2Q+xz0JXHXV+1m5zs1zTHwEMfi2+IauVh1Spe2tXbXsLaYO+NGEwt9VcBLkyE/XYHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071189; c=relaxed/simple;
	bh=vuhY2lkqYPdmhCdqIF/qTYvsfNNQQhJ19a5lmxkVFog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B4J+KbdcIc2Rn0H9oq3HV1d5ya3ZuLFbHvDDWrl1j/sMuiKFR6eh5sf/Xp0sDHqtvnUumgM0KTiZK83poS+K1U4tdtAV9z2ATWex9RQaSdzDcinkBRj1pIgN/OWgw5AcoFehLnACHMpeqhWPiKP0r7Y4FTCh1GdoKKm0AjEeWss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=idDWgHLU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kj7SVuzp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="idDWgHLU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kj7SVuzp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Du5BM412750
	for <driver-core@lists.linux.dev>; Mon, 9 Mar 2026 15:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gonURY8UIum2UspnH0bYd8s2CssNSxcb+o+HZBmH3T4=; b=idDWgHLUdSqFgNVx
	rdJiMqY5/iP6RpC4GVfHHygIFcCwz7T/I49WuibK9Af88X53MQ5XVJukzhSe/7ua
	XDNrJRXXXaSF/GMUCmO6zXa7o4w66Xt4bDqUs7HeqoVeCPxop7VGQzoBa200LpKa
	wRkzOrSRXoC1meykyivLqTposFLYdwOTnXWhEXt7H4t0EX1lSGr3e3L1ZL+EvioN
	2kHF1aJteyL9RKxs3zmpqF6AMvpLP0+rXAUZwhpf1sAHnOrD/f7gIbXl0tUnNOn4
	WSIorjIEX+efLdAwAXxDFMS9sRw1n0fFyAoJhulPWh66fgx2QA1M46E5mfLOm6xS
	eDOCLQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbrbm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 09 Mar 2026 15:46:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4b96c259so86458145ad.1
        for <driver-core@lists.linux.dev>; Mon, 09 Mar 2026 08:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773071185; x=1773675985; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gonURY8UIum2UspnH0bYd8s2CssNSxcb+o+HZBmH3T4=;
        b=Kj7SVuzpoWV9N6B8gZXs+93vPwNx91hBGVvPjQKMqCFCpX5F+wFw0vdHVOa6WsxaeK
         lMGYw0NosT7ZkzjUAQjtiXbnw2yMN4FQNS5rfgw9yoA33BdHn7nXiUbuiHfHagBnRt9x
         7UySNmzD+rtGVe7a9Oog/OQehwrZZt6aO2oYTPcnoskrWNAYRUK+z479eKfSjN23FBku
         nMIDgrmpewu7i3lxgel/9/YmrR1XWJW4QbcvoJZO3iVWmfolOUinLIsmsocH0a7uO+Kt
         6rYI6pYRIMrPKCrJDFOZVvd/A3HuPW61OJXsissZ6hImRgh2Mmn3a8wfGuZnpFJQE+w3
         5+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071185; x=1773675985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gonURY8UIum2UspnH0bYd8s2CssNSxcb+o+HZBmH3T4=;
        b=pGh1560+koaW+K0/Hh8RV66uIQSfC49QTthex2+nnNgmjmoAvZbHTb1gdC+8IaLlUj
         eg3nS3dNXZzRsSlxJKQlvvOtt57CjGuvS838hoLesM9rENCqwWJSwBhHFE2ARrLzejEU
         cEBALiBvtX7MdKUNteuRILw4bJ7pLKgGwrZ9IFeZwW0tDrpG5qLz6O1ZzajkHWAAzVTm
         r2svpGiP/JEtCtWEYfcwMb7T8R6NVFVP15E3AID3j8BEhNnDZ/zqrkHgY2ou/zEqrzD0
         bJKCdI18WMSGVcmSUfzEE5hjaED8KHMmg9UwaLmoh0gJxg64pViRNqeRqWDyTdObfTAP
         yZYQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4fT8jiU8XvjSsCltA0an0a4L2o1N1pmxaZh5cbPpqp84eTJ6ZDINeMhqvCVZR/1UIUFuKrOflvL00Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPmyZ8d1EcGEZ7Lhh5vYbvLS3VCPL22Fzgtq6Bkrme+oLQ0lJz
	T9orIWnnYMIIsV3bYmWrECme84qL1LNSHA4EpVmBhLfbDbhwNCiLWNi1td0ee6OI1wQge/nicUB
	YXJMMkDfvqAMNPYAAjvGT4ilc8lGh/MahlZgFk1HGwje9A9t8Q+e1IxzQ1J+goUeU0g==
X-Gm-Gg: ATEYQzzBjWZxs0CMPaJzYaP9zX3qyUB8wD616ih6Y1nJAXNWHGq7BMtj4Y5vMNbkhr+
	BSZu80SzZvH44tc5BcoKTi+OYOsRYw6dbZpThJzoocJBV7Q7T/jK/4LiyjVcjRgD28zwAwFEEMy
	INCvac7gauMKwazcsxwG9l6Yky/W52AfJXgCLYlDNYPJXO+fsW9yR9LlVTILsDh+8qriirgZoyP
	w3ddB9RzDEVT+R2rLH7p4s3xyrn/ekCL+7koFLgNAq06k+MwJKWhUNhdl2y37Ri0bY8MJ7Cr3FG
	W4RFCFBWWAJl5lkYLiWzk7oWQo6ef7g8Ah6tuYC7zE2cIVMRL93dsh0KODuGNuwrMIGeV5HX3Lp
	V5/Ese5ULyLweqiCpXS4OJ7nip/e2WK5UyCSCHEwdLqZhoIle9bpnn1E=
X-Received: by 2002:a17:902:e54f:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2aea197b7damr709455ad.5.1773071185018;
        Mon, 09 Mar 2026 08:46:25 -0700 (PDT)
X-Received: by 2002:a17:902:e54f:b0:2aa:d2f4:9c11 with SMTP id d9443c01a7336-2aea197b7damr709005ad.5.1773071184289;
        Mon, 09 Mar 2026 08:46:24 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.209.2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9d228sm119838665ad.33.2026.03.09.08.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 08:46:23 -0700 (PDT)
Message-ID: <5488a169-777b-4bb3-9566-78083613d40a@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 21:16:19 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
To: Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, linux-arm-msm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
 <2026030649-evacuate-emotion-422c@gregkh>
 <CAMRc=MebWaGPG=jMP-QbDsF+uaOSQFQyQ+T8Nhoh2jgo7VrFHg@mail.gmail.com>
 <2026030612-collapse-empower-285f@gregkh>
 <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Mdyu=vHEOSfh6wuDaEW_XXS5gi+JO3PvgHB0q4+J+GMZg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69aeeb52 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=SibS68aVnxHiogvcwlKZDA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=__pY0jlSMTdJdk2JTmwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE0MiBTYWx0ZWRfX0UjNLi65Ipch
 Kupg3XkLpqNaUaUyGuX83WeXBwYfoFJQeHLiTCGZqKM6c2EwSChsvvlPVQIVfYeRjH+MsL1DHkJ
 kO9sIgGe5/QRWbLVpD/WBtPNCFF2Ks1DfY4FSfcrC7AkYXt4AMfttVLHMxXS2LGcK+LgKBxzErG
 CRTp+MctNJGFoTs2SYzzzYAd0MZEZnc9vuPz65nsMPVxsjByXOB4I2JSvYzgAI33cHwcKwM+/hs
 Qc4ndIK4/NGJ/v8/Xdk2FG5tlhx7Deuh4NQEXgS7l3vgJZ/N0LBZyzFEMhXP72fSknE7kkNtI48
 743jGUg7mXfjk8zrUbVoMoKfxk00wmOrScpI3o+hqm0jOcHxDzJDEwSjlwdeEE2/Mc3W87v/TYL
 wyykAtCAIiBLBAHpoxE4vMv8SUSFu05J9f88miMRL2uJWAGlE+E5OehB8DQv10dN28zB3VDsBp4
 E4XPzVMQpIMYuXWfeEA==
X-Proofpoint-GUID: LDWzi6cirTRr2vWW0QL87JTvK9yOuB3F
X-Proofpoint-ORIG-GUID: LDWzi6cirTRr2vWW0QL87JTvK9yOuB3F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090142



On 06-03-2026 19:54, Bartosz Golaszewski wrote:
> On Fri, Mar 6, 2026 at 3:13 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
>>
>> On Fri, Mar 06, 2026 at 03:07:03PM +0100, Bartosz Golaszewski wrote:
>>> On Fri, Mar 6, 2026 at 2:54 PM Greg Kroah-Hartman
>>> <gregkh@linuxfoundation.org> wrote:
>>>>
>>>> On Fri, Mar 06, 2026 at 02:45:56PM +0100, Bartosz Golaszewski wrote:
>>>>> Add a new variant of faux_device_create() taking a firmware node handle
>>>>> as argument and attaching it to the created faux device. This allows
>>>>> users to define and read device properties using the standard property
>>>>> accessors.
>>>>
>>>> Why would a faux device have firmware backing?  Doesn't that mean it
>>>> should be a platform device?
>>>>
>>>>> While at it: order includes in faux.c alphabetically for easier
>>>>> maintenance.
>>>>
>>>> Hint, that should be a separate patch, and is never something that I
>>>> enforce or require in .c files I maintain :)
>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>>>> ---
>>>>> Hi Shivendra et al!
>>>>>
>>>>> This patch is related to my response to your reboot-mode patch[1].
>>>>>
>>>>> You should be able to use the new function like:
>>>>>
>>>>>    faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwnode_handle(np));
>>>>
>>>> What is the fwnode handle here for?  Why is it required at all?  What
>>>> resources are involved that would want this?
>>>>
>>>
>>> Shivendra creates a faux device that registers with the reboot-mode
>>> subsystem which reads the reboot-mode definitions from devicetree. The
>>> faux device needs to have the "reboot-mode" OF-node attached. In his
>>> current proposal, Shivenda had to bypass faux device's probe() because
>>> he can't have the fwnode attached before probe() is called.
>>
>> Why would a firmware device be attached to a faux device?  A firmware
>> device is, implicitly, already part of the firmware "device tree", so
>> there should be something for it to be a child of already in the system.
>>
> 
> Shivendra: I rememeber there was an issue with using any proper
> devices like platform or auxiliary with this but - as the series is
> already at v20 - I can't find the actual discussion. Could you please
> describe what the issue with driver matching was?

reboot-mode node is a property of psci which defines the reboot 
commands.‌ As its not an actual device we wanted to avoid creating 
platform or aux device. few references here:

https://lore.kernel.org/all/rz7tnl5gg73gtyij3kmwk6hubikfsvu3krekjkpoofpdio6cwe@innio7qvotye/

Till v17, we were exposing an explicit of_node based registration in 
reboot mode and then registering it from psci driver.
Post this, Lorenzo suggested to move this outside of psci and use a faux 
device instead.

thanks,
Shivendra
