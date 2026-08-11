Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24B8401492
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 07:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786433575; cv=none; b=AH7oaXnYGCi2wKWU93JCWuMEyaDN6p3A9NauKzfkyOhUvF619rE4ZESLSrsbunuim44zxAEnQFXSD/9y2urWF+9k/oEw46MsSrY+fxl+0wIEVkw1mwPfhUyzWpJS7ZK+ROsokZ6Cu4AtHO4IXgsmi6kmbS8y/ZXlytHqW+lfuoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786433575; c=relaxed/simple;
	bh=+tp2PqGdyroqhAj3m1ptq0FdDfaJu4hLv1vVQUx8a4I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=czL9mcoVcaNFsg/SQrTY9PWIliz+TZtzQPmBGMRFPHRJYyfLGVjIjT7gUPR0UC+2/vGOoYUSCez4LUbNNGN1NTxSs0mGOpqSZqpy9UoITqDgIo5LkzV4Aj+XaHGLiwKRKXiJr+27LawK6nzVbnNFMybxfBdFGbUsZL8lhWXFiSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FR0FZJzc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPri6Bv/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FR0FZJzc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPri6Bv/"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B7PAKS2939388
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 07:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zik0MM+Spytg8wiKrAMNSNHAKxnc0Bb68YfojdbtMK8=; b=FR0FZJzcNUR7w6Pg
	oL8H6ZkTmc0LNQKOxbJGG+cgzeVC+2q++BK6wBlW0mr9wKl+yzJ22eF9u+oVjhR2
	FrC3jTMC567StOT/lOytiU0oGtrNy4Bin+/iw+ZiR+3iZwDhAtnh0sOrktSyQgnf
	DNLH9w30DOWOKsGCqC23Obnja5KDo2P0AupE2r7HD5gEImW/Eq7EdNu1qoEjF1ok
	Iqdj/sLxVONotn6Z6WHyjjsfrGY0dnWOAkDvezpd6WyG6azUpKzNLht6Za0TlwIK
	deNKX8bB+HMFcWfQOuVqTXFy2l1r5Xjs3o/IfK3iOo9Vfjh37QgTJtLecpTj3DIG
	77/ZvQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjjv2w7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 07:32:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so515494085a.0
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 00:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786433568; x=1787038368; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zik0MM+Spytg8wiKrAMNSNHAKxnc0Bb68YfojdbtMK8=;
        b=jPri6Bv/ZIfmHQh+BnODAKxKJZaYbVcQF6N40gGNwDDWLUWpAMt5oXuH3kkjlUeN5X
         2dlIH35t/PL3u99W7dudU5VtZPfDaeXrUys1mLaxmmbLKB0pdpUP2bnOXX2Vjbwpkur3
         V5eX2wveEDO86f7r7JY+Ttc3h831DTNDaNvV4O0uvRwDGz3KzBi/2wj+TuAHEFM1Ngwn
         DIzFkjpHn7I9it0wwN32u1nsKXBdgwBSLBp384gHiC8jll0ikF0N7HK+pcdwmKRLrLSA
         ddD7nMcyPAkts3Vk8Eh04sklFaiQzbU92KkvqJ46lnM1epy9dSgbaxbAG3LqRzIV6cku
         zhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786433568; x=1787038368;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zik0MM+Spytg8wiKrAMNSNHAKxnc0Bb68YfojdbtMK8=;
        b=s6HnOFTYoOZhfJ81udP47LM04n9o4oRs915dzH2268OSVgPuSsxgtxVN2AWqNnaWQS
         yjU6jycQuzVCHDLyjFT9Mks/H/mOeLce8rACgyBrU/93W7vM+0hakha6ogDP8s/1O9pe
         k7KhcCUkbK3hy9nKpH7W1m4sP5MS/osDRj24ekPxWYgVQsB2Of9TTlr4qliUp2BKo1B+
         ZvxPZo+WfIJBkE8CrrpFzlW5KLW6gOQcVnKjDywa9+ZHYKaUZfu68QhH5h6D876u+Bjj
         un+BMjut4t34nJRtZIFXnAn/Ms7tHl2Hd/vQcwQzYGhYDeBZ/L2nsS8pCACixGv8/AHX
         5hhw==
X-Forwarded-Encrypted: i=1; AHgh+RrRX2cyPY0b+dvgSjMZgB4/Co9KXkvxqILj8EqHjFD3jdWmfaFp7wYpe+1F/OS+LSDuhVYQSIP60fB7rA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfPKKXno12P2zEJ70Xu2xHii0iNBG4ifZWjo2DYDDihG7ObsD5
	mCNvVSW50C8eFX/PYvmrdQBdigq/n1h4vlidxgHCnh8er9QOlBrf73YNo8T7hh3N530YdR+zC7+
	4pUWZS647XmLRgisJVIokaz1+GQXNCvjsrKLQ8RtOLzbtVpUIwkNjjWr9xop335V3bA==
X-Gm-Gg: AR+sD11YcOHwYtDspnudX72ydyZfiNxwrV8ZGLDeDY5k6cczPHZ9Kro20rOGC0XImWC
	2FrymCC8U06cjmZRKVDALqHlavKzdvNxY2VPa2lEz8Q1xPRRsXumAlIL65q+2YQQYadi7ByRZPp
	FGvcQ02fQp2Yw4WGNUIoHbXDYuAdovMCH9B+j0FmmZIQfuOxz8P9lfYRjqOXKLEmvDczFQbsP6j
	8U1Qb7WpESQx5HaMkl6PErkbmWbm8GM4nMkkWeFi/Uam+UJAu3tBloXjcLBIZoEBtx6vEy+WaZ+
	/5bQcsOls2cN9C/HeCTQ7KL3TFsOemcKtYmWUlH+CoDaC9wxnQbIDDmr13u7jJZZHR7tXasfzxT
	gpS18C1bjBOiEObiTS+y/ZgxixvqApW5kUHs063x/1aAbstcFFa0q3Jf1jDokDwGXtAzEH5pVs9
	HpEB9qAXk0zAWjvqrMxZOvzw6TpZtzzl7G/MHlZorkbDkifQwpv3NQZneamMM3/rY0HTk=
X-Received: by 2002:a05:620a:6482:b0:932:d9c4:3bec with SMTP id af79cd13be357-936a8f3d2cemr97740285a.38.1786433568641;
        Tue, 11 Aug 2026 00:32:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6482:b0:932:d9c4:3bec with SMTP id af79cd13be357-936a8f3d2cemr97737685a.38.1786433568211;
        Tue, 11 Aug 2026 00:32:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c20e40cc5c4sm22718566b.8.2026.08.11.00.32.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:32:47 -0700 (PDT)
Message-ID: <cb0d42dd-4755-49a8-8a05-297e4283914e@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 09:32:45 +0200
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
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Golle <daniel@makrotopia.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
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
Content-Language: en-US, nl
In-Reply-To: <2026081139-strenuous-greasily-f4e5@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA2MSBTYWx0ZWRfX7g0ODqhyKaef
 o7MRNMb/nkgjdQpe4bYbZ8ckaJ1c+jt0Go7b6lmDROxlHg/abfOUd0dxogrp2XRYTzNWR/T0jVz
 dY/UlRypaCx3JSKA6ADDqLrplMCQr3ug62BmHemqma6jnniNRlYp+yptBgVBjdaHgYyBX5VTWmg
 oYU/EjILGWhHB+AhZzXEmbmJaZTozxBtozU4AgbUPwMGw62ocy6USOh4uoflGeTtjGOxPFJuWzE
 qyH2oMV8Fb1Hdo+MisBFT+39X/x4zbxQtiBdXgX1ZkUD+Pau7e+8hD7Ugq+UmmW7ghhu/eS+68P
 xIWnrgVeX3LOhraqR9tiuVS+kmMBGoxJe/47CJxocotHcpNih0FMupjTZSR2aA/06n8skwIxi9J
 etsOwdtPKsZblD2rd4VkHFNon76tJt4moqbc6U4i2X1reUx9fiqlqf2Ep7KJBqbK0LiloKAENgs
 3/Y3EINvfJ6Es2Cj44g==
X-Proofpoint-ORIG-GUID: ttO8j4Bp30VGO23plEbY_h6mYDMzf4xE
X-Authority-Analysis: v=2.4 cv=KLtqylFo c=1 sm=1 tr=0 ts=6a7ad021 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=8OD1bfQqW12JbmighQMA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: ttO8j4Bp30VGO23plEbY_h6mYDMzf4xE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA2MSBTYWx0ZWRfXxOTi5dXouUWT
 WxqI6aRLfpFk0kpRkCSAzONcq+K0SZBDt7nOD2PPvbssUJECLhj3TEPCWgB+UhrFYt9J9WK0ZqV
 2r+isYKrovFwiG523wX9PW+pWSxxTIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110061

Hi Greg,

On 11-Aug-26 04:33, Greg Kroah-Hartman wrote:
> On Tue, Aug 11, 2026 at 01:47:17AM +0100, Daniel Golle wrote:
>> Three in-tree drivers (iwlwifi, hci_h5, btintel_pcie) schedule a
>> deferred re-probe of their own device from a work item in module
>> text.
> 
> That's a mess, why?  Why not fix that up to not do that?  Thousands of
> other kernel drivers do not do that, what makes these so special?

I can only speak for the hci_h5 driver where I added the reprobe code-path.

The problem is some of the Bluetooth HCI devices using hci_h5 loose all
state during system-suspend. This means that the HCI and the Bluetooth core
end up being out of sync.

So we basically need to tear down and re-build everything including
e.g. the firmware upload which happens at probe(). Doing a full reprobe
is by far the easiest way to do this.

I suspect the other 4 users + the pending driver which triggered
this are similar.

Sure we can do the whole tear-down + setup from some worker
scheduled at resume, while keep the driver attached but if we need
to duplicate that over 4 drivers + the pending driver which triggers
this then IMHO those 5 users are a pattern which deserves having
some helper to do this through the existing probe() + remove(),
rather then requiring those 5 drivers to open code this themselves.

Note that we already have device_reprobe(), which has 15 existing
users. This series just adds a helper to do a device_reprobe() from
a worker in a safe way.

Regards,

Hans




> 
>> The hand-rolled copies share two bug classes: the work function
>> ends with module_put(THIS_MODULE),
> 
> That's broken as-is.  a module should NEVER be calling
> module_get(THIS_MODULE) either.
> 
>> racing a concurrent rmmod freeing
>> the module text (the race module_put_and_kthread_exit() exists to
>> close for kthreads), and nothing synchronizes the deferred detach
>> against device_shutdown() or an administrative unbind.
> 
> yeah, that's a mess, don't do that.
> 
> Fix up the original drivers please, let's not encourage others to copy
> this broken scheme.
> 
> Also, your patches were not threaded properly :(
> 
> thanks,
> 
> greg k-h

