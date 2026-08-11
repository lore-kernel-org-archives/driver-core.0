Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3A3A0B3B
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786438320; cv=none; b=pEOCMeaHuOA3MnzQyScFNWJa6XEC5OSPzNdWtRDLcyNuk8bMrpkqnmoShCqfpZQ/4EWEV1u21tsDWkthxhrCchlCqeCBjfogUgrTMqyvyGsyBxmGYavl7Qa+hdkIDPKAs3DkS4MvlgJnBTAKd71P8wUlqsCILojVVBNighgbdFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786438320; c=relaxed/simple;
	bh=I7nPnuHKAd6p8Q9qirUeBbr32XOXSg2puw/1Nr5yEm0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sCCnipbkMTndPy6vDCq8sDghsjxNCUqHJCtfDBFOH0cJV7skzxQyBXjv+Iqxj0B4v8gCPg5VsgX/IhALPxsnufEZ4ylbHNN1Zk9BXE9Blaon9/KHD1ylD6yGrjLJ6xPesMD6nbrC5J0Dn92TTefYAbRKh7LE1r7APvStahcAbog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mptQ0Iov; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoHfd9sE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mptQ0Iov";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoHfd9sE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B6dOi32687069
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 08:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SPf3Qq35sizRfvRrlkrIrvuvqWT7RAryjsZcrodDY1c=; b=mptQ0Iovyl5nzwSj
	ktLVhbhNHYukgPzRYfj0kXZdB+EENabqatZRi1PaX4XaKAo6xmWM0j5WXvaHAu13
	kmWQzWoLWtOtG1SMUndmnMgMUolNj4+igIHS5ucD8ni3UnGVZYwep6P0J0A0+XQO
	z7ewLdAafeE3raFSWXBca+XFuwGJkEv1UdkTW5exBom63ZGLhK1FBGLHP/nXoCjv
	iSMj5rjzYr0I1UKEBMLMdMpfBGTKl2MwPBin6aBJ2/tUdLJ+2HjsPLkbpOHTAyzW
	pROeblbMy+53LiLvunvfd1ID8yOWaikgNGxASqxi+V2NEnSjncRji4VrYllF8N3Q
	MGNzkA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjskb8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 08:51:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d33c89a29so27995311cf.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 01:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786438314; x=1787043114; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPf3Qq35sizRfvRrlkrIrvuvqWT7RAryjsZcrodDY1c=;
        b=RoHfd9sE+PobpMCs/M9ZUNqjPMWYXNcUUpFBota9sawhHQwAcKt+rS7WUDLMkKElVn
         yV8/5LjKoa7ywGxyIoGDUBKZrPq9WATlxITRWWRmClBrJIUdcFMS9eXpHwQ2o011IyCU
         uRU+dsDy3XFPGxj4Myqx4mg3j0T4LyXEGeT8TDN0zD28+pJ+59YBNC0IIP6Qq6GffTZG
         NMJ15ia+7aRNxrpuIeURJxZxxMpz/A0aUdJY1c1iXoxm6aU5k295IjcSrW79K6CqoRZZ
         RLMjg88965jqHcVkWUMmtp6OH2Z1YUf5JGR06mazHhk/w7M58F8CtY3ZqXscLcQZPztY
         tl1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438314; x=1787043114;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPf3Qq35sizRfvRrlkrIrvuvqWT7RAryjsZcrodDY1c=;
        b=hheAzxUpAJqoZjLcP9pGWKR1eXF88fig3Tm2q6CGE7cQ6MxHvvRSrJltoahJ97lP80
         fmrwut6DdeOWkjZ5UBPKEDe2haD1z+MONIR32TslQ2tBPgGfjFl+BYczcTyl/cR+fnU1
         mkgEQUUX7t7O17w8b7yziDfnlDq3Ub/uCRrmpu73P3cuYYJWNOyArgYxoaxVtISl1MFU
         /rihCi9vFmXSS+PmUdokhv7QfM0BfiWgJa1g+AmYNnIQa7MkVfSIKpd/HybAYTArnr9B
         OrQLfPAj1NxT3jTPz1onaRkCxWJViwF57z9oPj79K3tbPKehKgEtFg219aSg1H9kVxly
         lT3A==
X-Forwarded-Encrypted: i=1; AHgh+Rq7p+MUmP0sQa+10VdvwunevadA5XvzGsViX/mvEVnW2C9wkdD0+2WOsevGHp753EPGpM4VFAiWQ346mA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxjwU9sT7iaQFTB4PZVk39nilKopK/svbGBPJNThP4H15fF+F3i
	1nEbZYLhWmjwDzYx2qsGYO1b0hu12L5P+9IWsfl4yMWxv0qtCUXkqxYj3WWt0wqq0ddH6lbBjgl
	zLxwjwDvB09rwrtjuQWs97KjGRXp0g4AQkdz83f8qWmCADyysj5x2G9TxfwrLNPnx4w==
X-Gm-Gg: AR+sD12F+i+5Wd9rtVI8Cu7fSRuVaKD4NtuT6zKHqVXrkMf/239oNWeOFuV2dlUeuSH
	nH5Wqu4x5B76ZJp/N9EKlIZpJUGPVl+LyB2xKOYHdOq0EhYbDbEKt836cP5oBbaU+MZLoRkSZil
	7HQKkw/2+6WsZwCjnA5G5brAEH2wzuW/X5o9H1tW3QhcEHG174UnUzyUA9h6XMZEyM8iIHTPhjO
	kUHmm43bzkvTuCvmYUz8IJUmJUHFWLyJcTLlXHcNMr7TK/+S5cbgJWllzvOOTLZba8lSJ5qRAa1
	+26z+Djhse7uF5Cbfy5ncmWKwhh8W0aBga6PFwdQASdDq7/NVqieQyReg6BYzizimHPHYu6b10d
	wz3odUcxv1P5UZDmfW+0Y7iDaEDVghNAZeY0uudtDs6udkijhfb4YESG3rogHMRQhgfSSYN9r2b
	f111ETS8GdxPzo4IsN2jdbuVk/+B6lG45Ba5svrl8zLTb9obUbmHfpvOXjFihA0sI9ABw=
X-Received: by 2002:a05:622a:4d0a:b0:52c:cc14:ff5f with SMTP id d75a77b69052e-52d5869539amr13603341cf.38.1786438313961;
        Tue, 11 Aug 2026 01:51:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4d0a:b0:52c:cc14:ff5f with SMTP id d75a77b69052e-52d5869539amr13603161cf.38.1786438313450;
        Tue, 11 Aug 2026 01:51:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20e435981asm27364266b.42.2026.08.11.01.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 01:51:52 -0700 (PDT)
Message-ID: <154779e8-5f73-4f3e-8618-104effb85538@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 10:51:51 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 0/4] device_schedule_reprobe(): core helper and
 conversions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Daniel Golle <daniel@makrotopia.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miri Korenblit <miriam.rachel.korenblit@intel.com>,
        linux-wireless@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        linux-bluetooth@vger.kernel.org
References: <anpxFdwNxk0XwPjQ@makrotopia.org>
 <2026081139-strenuous-greasily-f4e5@gregkh>
 <cb0d42dd-4755-49a8-8a05-297e4283914e@oss.qualcomm.com>
 <2026081133-crazy-enquirer-97ce@gregkh>
Content-Language: en-US, nl
In-Reply-To: <2026081133-crazy-enquirer-97ce@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3MiBTYWx0ZWRfXxkWWqaM97+hb
 dRvC4jJX4lE3kWbPla/kjlaFZc/wGQuJsSTgXpEK3e8ZTKrMQQMMuFFvVjCecF4ldGgy4yv8hlu
 d6fMzjG7/CmP4F+jhpkK5RrdmCTX+8U=
X-Proofpoint-GUID: tb9hlP-p0qddS9P_aeKqwd59iz6sPwjZ
X-Proofpoint-ORIG-GUID: tb9hlP-p0qddS9P_aeKqwd59iz6sPwjZ
X-Authority-Analysis: v=2.4 cv=cfDiaHDM c=1 sm=1 tr=0 ts=6a7ae2ab cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=66NDgXRySrwKPkD-ur8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3MiBTYWx0ZWRfX2IWV8OcHkPQI
 iFvALg+vDdg7IMspadFk3dFeL3IglDxnbk8prckx7ZVDxjW8sh+bRALE2+M3equUnBo0ZsJfHLZ
 G50CjtZRAEGwcsJJZWMUIDBeuAxtdw2YkencutP0QJJUBM7nRbRDUCTwfroPWBFG4GfiCxnRMmM
 ucNMLCiD0jGAhimMn7+6ZzR8BgBPimDVT07sMynusprwT1mx8WO762vFgF8rjaFrXTsxOuQg99W
 SiLg5Rn5+SVQHSEspq2KgdgztYfsr0vwypPnIe5L8M2dwHaqJxzhuuytXvqGYr48G0yVUHN97JM
 sdieKaO6gH8WHrpBVcKpK5JZCkdh4En7yFKZtuVH7dXKD8rq7DXhfrHeTOz13hl3puiTBsm6MeG
 +7e5uA/hJUiSBQqTaHAks40uATxowIbRG5MDwr3Yxor/KBGmLAyGHkxeWGh6EW4D9HsBvQNs6Kh
 cXGT16teNKD1JwZ57sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110072

Hi,

On 11-Aug-26 10:07, Greg Kroah-Hartman wrote:
> On Tue, Aug 11, 2026 at 09:32:45AM +0200, Hans de Goede wrote:
>> Hi Greg,
>>
>> On 11-Aug-26 04:33, Greg Kroah-Hartman wrote:
>>> On Tue, Aug 11, 2026 at 01:47:17AM +0100, Daniel Golle wrote:
>>>> Three in-tree drivers (iwlwifi, hci_h5, btintel_pcie) schedule a
>>>> deferred re-probe of their own device from a work item in module
>>>> text.
>>>
>>> That's a mess, why?  Why not fix that up to not do that?  Thousands of
>>> other kernel drivers do not do that, what makes these so special?
>>
>> I can only speak for the hci_h5 driver where I added the reprobe code-path.
>>
>> The problem is some of the Bluetooth HCI devices using hci_h5 loose all
>> state during system-suspend. This means that the HCI and the Bluetooth core
>> end up being out of sync.
>>
>> So we basically need to tear down and re-build everything including
>> e.g. the firmware upload which happens at probe(). Doing a full reprobe
>> is by far the easiest way to do this.
>>
>> I suspect the other 4 users + the pending driver which triggered
>> this are similar.
> 
> Full reprobe feels different than the THIS_MODULE stuff, which is what I
> objected to here.

Right, the helper from 1/4 to safely do reprobe from a worker actually
removes the need for THIS_MODULE stuff :)

The THIS_MODULE stuff in the open-coded implementations is there to
avoid someone doing a rmmod while the reprobe is running. The new
helper replaces this with some checks in the workqueue function
checking the driver has not been rmmod-ed in the mean time.

>> Sure we can do the whole tear-down + setup from some worker
>> scheduled at resume, while keep the driver attached but if we need
>> to duplicate that over 4 drivers + the pending driver which triggers
>> this then IMHO those 5 users are a pattern which deserves having
>> some helper to do this through the existing probe() + remove(),
>> rather then requiring those 5 drivers to open code this themselves.
>>
>> Note that we already have device_reprobe(), which has 15 existing
>> users. This series just adds a helper to do a device_reprobe() from
>> a worker in a safe way.
> 
> That feels a bit better, as long as this code really is "safe" :)
> 
> So, how can this be tested and fixed up so it isn't a RFC anymore?

To me it looks like the main things are:

1. Agree that a helper to safely do a device_reprobe() from a worker
is helpful (I think this is done now?)

2. Get patch 1/4 reviewed. I can do an initial review but I'm not very
familiar with the driver/device core internals.

3. Test this. I can test this on a hci_h5 BT HCI that will hit this
code path.

I'll try to get 2. and 3. done soon-ish.

Regards,

Hans


