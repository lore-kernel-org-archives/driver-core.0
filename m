Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792990260;
	b=sV+JrzGu6zQhIlC3wSuC/XHJ7A7H1um7XzuO3cH0HcgLfzbmrDoK1LCDHViLzLmMfmoG
	 /i4M/zAEpLx8XGb3FQx1YFUxEf1vzqXJdxJHFRdFVn4NwgvyB0E8iWUilVous2VU6IHVD
	 Ml8GYmYJ70uUZhxt7Zs53wqMYKYAZx9mBBvqHuJuWIyMD06I/5mysaQH0qV1GcjR3QA05
	 0wd1gG4BBMCfyxAvogRi8mR9sxhbI3EUzKei9C68kqb5C4ofbBHwhQSG+b+Dy8EEw7ehJ
	 hKo+9yIgQvE/7ZDJhAxuTbJmKO2YaRzUlmpJ+ygmEJmixq9r6y4CQvRWl500mxW7BVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792990260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=;
	b=J2LBBDA+b6AfEjFtXH/+/ylm3zRTqFO1R7tH0eybzKPF1tKIPnx87QjqRHX8PStlC7F0
	 7zp6iGmkU2qyDd/RuKSqsVXNfH43W0U0W/CtvAX0dXLpxOYRHNL63gZMZrYkA9AEYtmta
	 b8o6nd8Bzn1YrmKc29dOTSvvamGgOq7VwjaTrQ188t/a1TgIRKKQKLfTvPNLV/S5QtUzf
	 FENt7Qdz7N8qJK+9WRyuL/7HO2TqO2HKWAWjMmd/Oa4x7G58KpdSSMmFt28hUivyQT7yA
	 lvjxmruFdB1oplnp6mqyoxQ61Z3nh84oO1Ki/E51bvS0aPk586T9XnVElJCbefBkjJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WHSA6vnM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9AOvmEc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164BB606A31F
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 04:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 164BB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WHSA6vnM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F9AOvmEc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b8Nl1908167
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 04:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=; b=WH
	SA6vnMeCiMR8EvqgM6oo6Jm+PcVod2kyYd0RTXrstfPX7B3R32jVXL1XESsGVPsR
	Nkmn2wkJ48nfu23C9n0UmaxhrHE0i0AIfVnDx4mXh2dlc/AevMLhtenFLnhfnCXJ
	1TiVRaew67e+KU/JDhT/p6+Z3BBl2vcVMBwq/5PmECq1ixQzOmijMjthIx4XuAaF
	A1SksU9VR02CqrAST/cSBURfou8lIdHAcOwBzTFoUsbvlBX0+a7yc+eov9YN56bu
	YSeHmU2N0FCEAPsWFdvvUNuiRGdZV0QWqoJqDr7fmEWqsU1C7ZKCWdJTtJjjIpj0
	9Qn0pINW4udquARjtmuw==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gmv3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 04:50:58 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6799288480dso4946562d50.0
        for <driver-core@lists.linux.dev>; Sun, 25 Oct 2026 21:50:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792990258; cv=none;
        d=google.com; s=arc-20260327;
        b=p8n1V2Ac7TEavPPmjnZ+mqGWumG1DgvidcAg+Hj3SmhD7eP44YLkqONOvbGRzBb/Bh
         ubVHMABKRVQ3IGPkoTf4XygV8x895D2cAGRknsg8JrP4WYdXRRl+nBtjvdiV0lMa4eVq
         pWSrMuaBQJVr0JFi4IiR35yrCpMYtsSW7O4Ln2nVyoTKTrgOp8g5/cT88u3DhgvgNVIi
         FASffuyGu5OIMicZ7TZIcttOwMn5BUARvYpr52QCxYaXXLzB0OT8ugt86HEQecQK4jb8
         hyMold3jcwQM8PqJ48QDPu7nb2NBnU0CPdIgdtOEQlQ7DOjkcasU3qIAAUynmVN1Iuoo
         Tfow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=;
        fh=M10cd19IFF9f5wIcI930MDHNGSPST4CZ9KOJqazoqKg=;
        b=ktW8jNCaFo9uF/+bjshSmvqqMYqegTSPinXZP8/VBfVj0zC52VKAJmdt06zudITuo4
         FGdpOt3T51vYjcRm+1nAEQZmgpvI2wKXg/0HN9rmeg/X/O+D+27m5RQtwQ0mpWz2zhRE
         OudOvqAIaUON6ste9JXFSGk3qbnK9/6M5PiFl8ntbjXiNFXfiiZe7eeakRAh24+o78Ey
         c5ATzWLzOsXLL1YPJB4lMOXbEA08eoYgb6kTHKStXiCyQQ9Tjie8Cq/j6NKWHPVsZnAo
         m1tdDWK4OD/rzTQymrc6fYYrecrX0gyeyO46uDn38veiEhJUCfStZT6HY/2I6CVEQmHV
         NiRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792990258; x=1793595058; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=;
        b=F9AOvmEcmSSIIshOpE5FTXZRIqfJB/r1QCSQE4i3xte4EOarHnpNvCmYHSAGe88lGa
         mhzMKJ2E6uO8Lnt3yrrSxhpQrXLKQUX/rZ3sfmGkwuMk3/CbOf4ViPCREcP7Z4Dc2sC3
         I0TnCMghWtMxj9O1g7Mq/hY13UO6HCEefrf2KcNTZL1rFiTBsw/AFdRtfpk2qO9MY8Gw
         /FfTCv4X5NaxOCirsHHDx9Eyiz6AgQqRHAXbuR9mfqftGbqJTOI8V7X8+OlahtL5fEwn
         qbB2WGioeUwgnV81jv4aKPmcZ/rM3cja/yRB/S8zXzEUE2AvndtEQZ1tp5cXLcT9Vwkm
         ID9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792990258; x=1793595058;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zLeMuPnq+PRN+qUyA9Lb/wfh2++JYWPj9vtOQkTlII=;
        b=G5W7QhzzWN/zlXWGarbIfLW8NiMmyiKa3Jgz2x1twYwdZ7uMznGHUy/mikHYgEy+gR
         T2DJ/AYjGiPW6UXBJXm5PGhRH5Ooe+X8CLGuXcfP2qZgwtmIqFMvRxF/OhhuU62zmHP9
         T9Fi5SQSYjavVRq65FeMOhIiG5T12ZZZg8UKyVrnxRcdlzqPxaRHS+viSxrxihDeklp6
         KVyxRxlhruFMy99z8HhSHb+yBDOL/dUroxf9k4ABn6UjLgai/runnN7zMr4PD4ZbkW1z
         gKVrpWntwgEOGSK4Te0p7/qYwUi+bmlwVlMOi1wy5M9RUe4eUKYejDH5vBwOuTI325XH
         Sgkg==
X-Forwarded-Encrypted: i=1; AKwUvByzss2zsSKTxSR5sQ7SvdILlFSIIwBKhhMeCeAxZg57UdmoICG34ZUbGt3op3Fjlv/HdyqtVemhWM+xiA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ81aWWxM7JIbqvb2iXbwTL6jmDDZNTJ0FosvGODk8hnCnAhKO7
	L4xdWz0KMsQmIK4rZcJfPI+zxVoluu4PnX2qWxCz2uxsSZQlLND31CtbZ9/cdC5ErWsiKkRmGEd
	rZfvqjVKFA3dGF15aqorzQYrNafU1A4P5zR+iRk/uTAdG7ProN0y/FJFNw1YJDax09ljeWeEy3N
	e34kqMZnrlCSVW92iI3tNLqdubdCNNXUCfVQ7bZzzF
X-Gm-Gg: AYBFou3MLBc+gOjkLOJ5eS6WQ6L/z31D0fLEKtMt+Lxzc47DmySjEPUcWaqP6OpMQhd
	UFEmRHVQ6EbcIrJ4TXp3bjHFUSI6rMt9v7N5Igvv6nCFMSbV2jwdtxYMd+6Xwe34qsToHPAujY9
	XRshKZkV1uTljdqVuUT1vldmdxFlmAAxYD7eEYWwnd6tmezwWeDrZonUIx9dc=
X-Received: by 2002:a05:690e:1182:b0:66f:d560:32f1 with SMTP id 956f58d0204a3-67a45498ae7mr3358070d50.39.1792990257826;
        Sun, 25 Oct 2026 21:50:57 -0700 (PDT)
X-Received: by 2002:a05:690e:1182:b0:66f:d560:32f1 with SMTP id
 956f58d0204a3-67a45498ae7mr3357961d50.39.1792990251177; Sun, 25 Oct 2026
 21:50:51 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <arqSqcoWAkhy-8do@red-moon> <d1720b63-65bf-4019-bc19-1852555f7993@arm.com>
 <asieTvinZ7c2QpQm@red-moon> <CAJZ5v0hVLSJs1j8J1TV3yJ8Psyaf=B_0UfHsYSMtM5xTup0B_Q@mail.gmail.com>
 <atXyIadz1TEKSodg@red-moon> <CAJZ5v0joJBZg==DWPsNviPfL7Jo=qupRhb6GinqOLoHXGnvevg@mail.gmail.com>
 <ateI-JcExDyfXKrs@red-moon> <athimRqtDvQu1ZzA@ashevche-desk.local>
 <atiAmZSPiRNBAO5O@red-moon> <7f077fd3-9c67-409a-b46f-7f28a55c180b@arm.com>
 <atmwo3Bpi62kB8_n@red-moon> <CAJZ5v0g56LP+EQc6MQ1H_5XnQALEn3CV9Q9HGCoiuMvpkK+N+A@mail.gmail.com>
In-Reply-To: <CAJZ5v0g56LP+EQc6MQ1H_5XnQALEn3CV9Q9HGCoiuMvpkK+N+A@mail.gmail.com>
Reply-To: sunilvl@oss.qualcomm.com
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:20:37 +0530
X-Gm-Features: AclHuK-1DHAybX8n_MVkQPFIAt-ZTZyBKU1HsuPQ4k0q0v0UpqTvAKQZTHvj7-E
Message-ID: <CAB19ukGr39DrSXdR9Gy=YxVSXfPgYB0oqqjggQNBfedMjVtAwA@mail.gmail.com>
Subject: Re: [PATCH RFC 02/11] ACPI: Introduce irq_get() for static fwnodes
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Hanjun Guo <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
        linux-watchdog@vger.kernel.org, Grant Likely <grant.likely@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: o5PbYpm7t6j6k6XoHg-1KRrG3qIn9BPl
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adedc32 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=67Uejn7MJG7rg031VH0A:9 a=QEXdDO2ut3YA:10 a=nd2WpGr1bMy9NW-iytEl:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: o5PbYpm7t6j6k6XoHg-1KRrG3qIn9BPl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAxOSBTYWx0ZWRfX+VZCk+/5ZBZE
 SSrHCILurjZYuXrGWQD41MNPnWKu4H7IS0ZDRqwseWH16A1dXWXSU6uChfOQC6BX1xCkzZwsFgr
 beurJ9922L8xk03aai5wREaURCfBUiwfH8WUyV1TEDfFkczDMMh3cQen8Gt/MoPoONa4UM0EIw8
 ek9EocqzgZ/DA4FVtSt8AlpPoD8RyaP5tF5Ej10O/EWv3AX4j2d8CTC+I0SeyoiLwHt7z/fmvTb
 s4hbae/92wjWCYMqlSGJg7SwVee3lPIXrkaDO3SvOcNUigPXiZCxd9gO0lj5n3hmM32+XHoUkRn
 ROebaB2PMsGR82RcrzqTFKHiwR1OValqZMXtdZrRetUH4Vn2A9GYwbBgJ1cHmjBOLt9U14XNESW
 /Lxd+5YWPT9QwOTzZIlI+/DtU9mKApPRo++lS4rKqfXxsQ3ceaBxeKlOdcWIW8E96V5enmoUzL6
 eZxDhd2dfJs12FEPUVQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAxOSBTYWx0ZWRfX6xkdVPeCyhmY
 COjXDR2AkRfeyGx2KujRvSQfApG2S3rB4jyoBIwmyzXJ2zIlgVLNcYCpgdo7XTcs6LLl5+AJXBr
 fjvR9UQREQW0pExgxR9u45Dms9JhedQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260019

On Thu, Oct 22, 2026 at 4:18=E2=80=AFPM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Thu, Oct 22, 2026 at 8:43=E2=80=AFAM Lorenzo Pieralisi <lpieralisi@ker=
nel.org> wrote:
> >
> > On Wed, Oct 21, 2026 at 12:18:39PM +0100, Robin Murphy wrote:
> > > On 2026-10-21 10:06 am, Lorenzo Pieralisi wrote:
> > > > On Wed, Oct 21, 2026 at 09:58:33AM +0300, Andy Shevchenko wrote:
> > > > > On Tue, Oct 20, 2026 at 05:30:00PM +0200, Lorenzo Pieralisi wrote=
:
> > > > > > On Mon, Oct 19, 2026 at 08:05:50PM +0200, Rafael J. Wysocki (In=
tel) wrote:
> > > > > > > On Mon, Oct 19, 2026 at 12:34=E2=80=AFPM Lorenzo Pieralisi
> > > > > > > <lpieralisi@kernel.org> wrote:
> > > > >
> > > > > [...]
> > > > >
> > > > > > > Basically, yes, the idea is to defer the creation of the plat=
form
> > > > > > > device until the dependency is met.
> > > > > > >
> > > > > > > > till the dependencies are cleared but then, without a _CRS,=
 where will
> > > > > > > > the consumer driver find the platform device resources ?
> > > > > > >
> > > > > > > Well, good question.
> > > > > > >
> > > > > > > > There are multiple facets in this issue and possibly some o=
f them have
> > > > > > > > been already solved but I need to pull them together.
> > > > > > > >
> > > > > > > > > Note that the dependencies can be added to acpi_dep_list =
after
> > > > > > > > > creating a struct acpi_device with acpi_add_single_object=
() and
> > > > > > > > > acpi_scan_add_dep() is not really suitable for that, but =
it should be
> > > > > > > > > doable if the dependencies can be found.
> > > > > > > > >
> > > > > > > > > > I need to have a deeper look into this next week but I =
wanted to ask first
> > > > > > > > > > whether there was something I missed - most likely.
> > > > > > > > >
> > > > > > > > > Well, it is not really straightforward.
> > > > > > > >
> > > > > > > > Yes it is getting messy. This RFC, with all its flaws, does=
 not transparently
> > > > > > > > prevents enumeration but rather relies on -EPROBE_DEFER to =
sort out
> > > > > > > > dependencies - though it does so by adding more stuff into =
ACPI static fwnode
> > > > > > > > that to be honest I'd rather see gone.
> > > > > > >
> > > > > > > I think what you need is a notification mechanism that will t=
rigger
> > > > > > > when a specific device (enumerated via the ACPI Namespace) be=
comes
> > > > > > > operational.  It doesn't look like any of the existing ones (=
platform
> > > > > > > device probe deferral or ACPI device dependencies tracking) i=
s really
> > > > > > > suitable for your use case.
> > > > > >
> > > > > > Yes. It might just be a notification from ACPI core to say "the=
 driver for
> > > > > > this ACPI device probed, go create platform devices that depend=
s on it".
> > > > > >
> > > > > > We can check and track the dependency in code that does create =
those
> > > > > > devices today.
> > > > > >
> > > > > > I will think about this to see how bad this might look like.
> > > > >
> > > > > Don't we do something similar in drivers/acpi/x86/lpss.c?
> > > >
> > > > I suppose I can add a notifier that checks whether the device whose
> > > > companion represents the ACPI device a given platform device IRQ de=
pends
> > > > on was bound to its driver and then map the IRQ and add the platfor=
m device
> > > > _then_ - after all that's what acpi_dev_clear_dependencies() does (=
similar
> > > > at least).
> > > >
> > > > There is still the question - where the GSI number, flags should be
> > > > stashed so that the notifier can grab them in a uniform way. We
> > > > could simply attach platform data storing those values to a pdev, e=
ither on
> > > > a per static table basis or generalize the data so that a single no=
tifier
> > > > would be able to deal with it.
> > > >
> > > > That or I can just piggyback on acpi_dev_clear_dependencies() and a=
dd
> > > > a separate dep mechanism to acpi_dep_data that instead of being acp=
i_handle
> > > > based the consumer is fwnode based (something Rafael mentioned befo=
re).
> > > >
> > > > I will have a stab at this and see what's the least bad solution I =
can
> > > > come up with.
> > > >
> > > > I suppose we are scrapping the -EPROBE_DEFER solution (ie this set)=
,
> > > > what we are talking about above won't need to defer anything other
> > > > than the time when platform devices are added.
> > >
> > > I dunno, that seems pretty drastic for some use-cases - the fact that=
 a GSI
> > > is described in a table doesn't necessarily mean it is critical to de=
vice
> > > operation. If we don't even create the device until all possible reso=
urces
> > > are available, then its driver never has any chance to decide whether=
 it's
> > > happy to ignore the deferral and just use MSIs or polling instead...
> >
> > I agree with you (but that's what we do for ACPI autodep and AFAICS OF
> > devlinks - though there there might be opt-outs).
> >
> > To make -EPROBE_DEFER work I have to pursue the approach undertaken in =
this
> > set and apply requested changes - I don't see any other way.
> >
> > Are we willing to accept the approach taken in this patchset (I can rem=
ove
> > software nodes and make the whole thing ACPI static nodes self-containe=
d) ?
> >
> > One way or another this ought to be sorted, please all let me know your
> > take on this.
>
> Please make it as simple as reasonably possible. :-)
>
For this use case, where platform devices are created from static ACPI
tables, I think adding fw_devlink support to ACPI is a much simpler
approach. I proposed this in [1] as a generic solution, but we later
realized that it doesn't work well for cases where dependencies need
to be established very early (_DEP/autodep worked better for such use
cases). That limitation should not apply to this particular use case,
though. So I wonder if a combination of autodep and fw_devlink will be
a better solution?

[1] - https://lists.infradead.org/pipermail/linux-riscv/2023-December/04614=
6.html

Thanks,
Sunil
