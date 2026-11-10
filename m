Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312082;
	b=JxFnfQUYHMqlFcgS/Podvmdy2v3HdusDXHi8cFvYHs52aRrvWtMu6evKapbafvg+9OJx
	 Unf4kOxSVTtFjjmvnw143X1fLbcaCiPV2BsoTv96ZdTQy6dh0a55Ahn/j39WGB1QDnv4F
	 aj2lD52adKmpks0OIMBx2QXSRo2SU7Cb/k2i0RbKF7LZagwSNHEpgbD8xnrnofvqzZ2Zp
	 hvDdFje3kWJPGyZrPfvjNFuo+4ciq8bOybTfAsWQJHerWCeT9GmwVoZUgdLq4azdDJRdo
	 Kr/2GoYfrfX72Bf8csc2tHFUisQwPNpeihc033jCmskiOs2J6n1H72p5CVLFicCEZWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wjHjihWkxK/xBC3DjLG2PqbN08tv/LZZbFWJaPS+3xg=;
	b=njTBC+oTuTIYoWLKP4lTzZdSNnKy5764yFq/5yawUqskzo4LVkM0WMcKOaHlJnDovKWt
	 BpJe+eutgl9qUkJwCy4A6ySSAI5fgSR5BoCtQfbBVlxfqZhpeh+PvkWYTPWUrmgjqmAMP
	 ODB9oKQqdtvdJOyArEFppCFGNlx3uK+Z8HTCgF4uDXCj+RPQpusyopUPlxkp4GYjVE3mz
	 jPiZOwgSAEHLeDS0sBba6Z0Uz272Rhl4o5jLJE5Hva5nA+WnN1EGHYf2nMjVvntuK9Xp2
	 MryQBXzspcAlqGVJa9GYps9DAk9+gORBHoMfQ6trmdTEPB74cRO4tCXrBdRUGc4ZeuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sieoqw26;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BogyzFhA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55336606A33D
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55336606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Sieoqw26;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BogyzFhA
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABANQk1599656
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wjHjihWkxK/xBC3DjLG2Pq
	bN08tv/LZZbFWJaPS+3xg=; b=Sieoqw26fV7zxgat8ywnjRWoRqGVzwhlOUxFxd
	Zbeatep+dNrwznKYZ1NeXO0oKYGPxqZjFNnr1FypTrXbW2mC15QPshPDKVm0Xjz0
	HuEDOItdecF3VenZXH4MGD5VAOX3NLIz+RAiORmZUvVRbDzv7l7RoUlm8waNYDt4
	Kh+t4m83KcpOf8LjIADTz/GL0Wy85EyhXdT8jRYvcU9rTbn/tDpohlHPEQ5ChkSj
	78KONN1rJMH3FCrOxuQWA2eiq54lVD5ZyYsFWzzOLLgSU4gdoiLjLZbyZZkSA6YG
	1Fpu20vfXsUa13fnE44pXC/yk+nv4Iugjhb7YC8jrwcu97iQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hutv49ycr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 12:01:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so1700650137.2
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 04:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794312079; x=1794916879; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wjHjihWkxK/xBC3DjLG2PqbN08tv/LZZbFWJaPS+3xg=;
        b=BogyzFhAVziOZqgkDLKlMPunVONU5Uz1zPQyIU/PpCrUU68rpgWFEqXpcyqzfIEaGU
         O9XXhjLu0xygDswHSpfNVLBAjMPSajEfJ6GWOmRsyDYi5b1zZVGwIjlx2vKDSK5Gt82O
         dz09k18l8oCjwYDJrH+XOSRmMi6juTgUkrDxCxKgzoJTWG605B0DyfVA+7IEp+3NqDFp
         uXQS7pmS6vWrXOgPhDBcLNjY04Mm8vusbWqlkqSVrChE9c1uDcPpXDRLt4aZkNTLWLdH
         fjniHu3Cbk8yPFkOWTj9KQeBclNgIlKm9xS6lW7vkNqWJxm3qk/i5OvdBcUl6IM15NRQ
         bXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312079; x=1794916879;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wjHjihWkxK/xBC3DjLG2PqbN08tv/LZZbFWJaPS+3xg=;
        b=NNDH8e9VYbid2Ki41vmJrdgBOtkn58OSbhB5993Vfe1E9UUEJ7wTVuiOW77EZJs9T1
         zb+/X2bgSTlWMxho5JH/9EJepFmpJYI6PzMeGpWBk0/6e3+l8Uh4tzRlymR5AP5Mgo9E
         QXwTstFIrxafUCzvGv+ilRW3vZUvYXRZ3ci2t4OZu35fkOAskPnoXSHynHMhlzVF6DMb
         OZ8nJSxtvxlztSbIQqpoa39piYKceYJ18T//CHgMs7YZXhXuEnlrU9eb8qjTNLQGTBKx
         /2hAmVHE6W2w1hW1zFBgMY0sl9AoR8bYOJ8i+bq+u+flBIvtypBiao28GKMAv/70IGZX
         OOWA==
X-Forwarded-Encrypted: i=1; AL+hErHvbEr6cjmIYUQiUv7YSUTj4PcW84g4d+ABErk1PcqIZG2WWjSab/3+J5Hx/xsUyzm+UHo/kVD5q0u7/Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z9ejHTZ9X13Mh7GqVQfj8Teq9hDgDBgIEr41WVoWb8M/J2xvE5q
	nP6+x/Rttb7G7dCWl2yZSMZTkKO5bY3EgOVAINC39XubV0UvvQUrNPHsdxnduWhzSAF4nfX8Xmk
	zK5pCmW51/mt64wXJGZ8jg/RkhCu5d4/wOL/MlwEv0GkAMdzHMWltinxoXxogvxfseA==
X-Gm-Gg: AYBFou0ZEWxLhfnpdwdjnuPxdjE36dOgSNExN4kmljLvBmQXR+BS1sw9HDihRDqlLlI
	3wzBXQGABh0fXdJSWahRbQY/bcbtvtdB/oAsphKtWC3Q7v4MRsK/5PDfvAZHoqeEhW2Nf01oncO
	D9AFk5df7FJ0N27Lnb7LSVAwW6vLzlC+/AOLQ0F/OuSS/8SwhBUgmju3wbGO/ZDI0VFg7dpbMZW
	EbOvEL+dcgpzuS80+iLatVzJ1uF0uasusDLnRUkz1p0u1a+CBltLmpGYiKH2YbkMMCLVFayfm4h
	WM1Z1cun1msw5uQ/eSQoZAVtMraH/QEJ2UMS6H04J7lVWeJrrHMHikGc0hTLz/TTDDsO8v1u/lu
	ay5Ngde2bYzosoEzuxmnU/WxnF9R2sfRRutEVFa4rtZxeWzUw3Knv7zW5z6Y0uspP+r10kYOTuR
	GPDHkWxDarUv64wiXJdf8eLBil+32DzMpCuMTgCu22Uvp6nq5dYouAo1GtZq7N480r1PLdUTAAT
	fDN/oe3zQDDHI7MNCuTgKDrpsw=
X-Received: by 2002:a05:6102:2928:b0:7d0:6e40:f3e2 with SMTP id ada2fe7eead31-7d301c19bf8mr734198137.28.1794312073139;
        Tue, 10 Nov 2026 04:01:13 -0800 (PST)
X-Received: by 2002:a05:6102:2928:b0:7d0:6e40:f3e2 with SMTP id ada2fe7eead31-7d301c19bf8mr734163137.28.1794312072593;
        Tue, 10 Nov 2026 04:01:12 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:a91e:6b1:bddc:2951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fe2cb2sm56820295e9.3.2026.11.10.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:01:11 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/2] PM: clk: Release clocks across runtime suspend
Date: Tue, 10 Nov 2026 13:01:07 +0100
Message-Id: <20261110-clk-leak-v2-0-d044cf0c3f1d@oss.qualcomm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIMH82oC/22MwQ6DIBAFf8XsuRjAiKSn/kfjYYW1ElFaaE0bw
 7+Xeu7lJfMymR0SRUcJztUOkTaXXFgLyFMFZsL1RszZwiC5VII3nBk/M084s4ZQjZ3pLMoWin6
 PNLr3kbr2hSeXniF+jvImfu+fyCaYYHbQZlAaW9T2ElKqHy/0JixLXQb6nPMXU8Qan6cAAAA=
X-Change-ID: 20261030-clk-leak-3ea6f7c7da25
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX1wJcfa6lTQYM
 JpvqUqFqXR9PvKgVM0fZZSXLcnkJFovanvDoVva2u6Xp30ASEa2sZGIDSFZSg44NsPJEPtAnE5v
 NRjagEKzDlVONojiWnhVq3iEC7glngI=
X-Proofpoint-ORIG-GUID: ENnYfAVW05XnWHeCE4wBHtem3apM_PJY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA0NyBTYWx0ZWRfX1SbluUY9viFX
 GLSQnXlJax+SFJeM/BZl3BecVSVpo1jioI7MBYDqpI4VC9AMjElM0VrmZA8ObGSSvan5AU6lF+E
 ZD7OTnlaz66xi7PWxVkqwGmV/PEHESWFMT+OkbQkNT9t5cVE45ITQWZZQdHBjKrbnED/IisSSp0
 Ba54mx8O8YIpymesJWt/NWQpk2pUcsobgLOGPDnZd1hzrpBTHfGeYXRPQh90HTv3DahxDAlx7S8
 AnyPJDXCvQaikauJvfE7ANCS4o2bOkLyALay46kezwiUyBXFvDqNIcr2AZ9mTnkY/GX9ietFzmV
 lZcv3qAsv6eNlLPiKy0XKM6vrf+bksPOyQRilCjOpyrySfMEcC7E06l1B7wqKn+tB5P5JtSzN6w
 1gIS7j/JUjOS/z7jaPRUTutGpPGVifizP2RaxWsYunPooCFeiCaEuKHoQsJRsgN+sVH4qRx7DWO
 zxBHyF3dXYbGRufvLHg==
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6af30790 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZpB3dmDekyYojdqYHaoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ENnYfAVW05XnWHeCE4wBHtem3apM_PJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100047

pm_clk prepares each clock when it is acquired and keeps that reference
until the entry is removed, runtime suspend only dropping the enable
reference. A prepare reference propagates to the parents though, so a
leaf clock can pin an ancestor that only implements prepare/unprepare
for as long as the device exists. On Qualcomm platforms this is how the
RPM XO clock stays active across runtime and system suspend even though
all of its consumers are suspended.

Drivers that manage their own clock usually unprepare in runtime suspend
245 clk_disable_unprepare() call sites under drivers/ against 27 that
only disable. pm_clk is the outlier, and only because it cannot
sleep for a device that suspends with interrupts disabled. So rather
than asking each clock whether it must sleep, ask the device whether it
may.

Patch 1 derives the locking from pm_runtime_is_irq_safe() and drops
the bookkeeping, patch 2 then unprepares on suspend. IRQ-safe devices
keep the current behaviour.

A non-IRQ-safe device now prepares and unprepares on every runtime PM
cycle rather than once per lifetime.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
- Split into two patches: the locking rework, then the unprepare on
  suspend.
- Keep clk_is_enabled_when_prepared() in pm_clk_acquire(). v1 used
  dev->power.irq_safe there, which runs before probe() can call
  pm_runtime_irq_safe(), so the flag always read false.
- Drop the clock_op_might_sleep count, the pm_clk_op_lock() retry loop
  and the caller name argument.
- Reject an IRQ-safe device holding a clock that is enabled when
  prepared in __pm_clk_enable() rather than from an in_atomic() test in
  the locking helper.
- Link to v1: https://lore.kernel.org/r/20261030-clk-leak-v1-1-db8cb68a5a8d@oss.qualcomm.com

---
Loic Poulain (2):
      PM: clk: Derive PM clock locking from the device's IRQ safety
      PM: clk: Release the clock prepare reference across runtime suspend

 drivers/base/power/clock_ops.c | 145 +++++++++++++++++++----------------------
 include/linux/pm.h             |   1 -
 2 files changed, 68 insertions(+), 78 deletions(-)
---
base-commit: e726cf08ee6ba7e8b852c77760f12c59f90f1338
change-id: 20261030-clk-leak-3ea6f7c7da25

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

