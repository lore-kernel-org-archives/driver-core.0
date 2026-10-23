Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750455;
	b=s7rslipMCR+/f1paeAKxHPdP9zTZkfBAsj6X14wTAwSvDFHVYcQk/E0gz4YvMXRBtIWN
	 qAtsSJj44oigLwpPSXUU+pxT3Go/c6XwKxDTV29+PPn5nZidovOG9W5vPP9iwnZeOfDN5
	 fpV0rdODLsk/8GnDqc1Gs0wDZa5hUOeFUP3XT+tTGVkun8/Nj5Pm4OD5COj1DBJOW5j09
	 b50ORTkroVjghAMMjqpppYU5zn/zB/P7JDcyATDKVgEKkl9fdaGBd+4K1lxwMwRkEde7X
	 7R5a9aQi8In3HJJw+PFJUbulzwe+rmeqa3q5Ga5CuQ+uWOYKzrC35Vwif0467l823bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HAeWxfZTcHlKlNt7pgixx+1a1cs5BFavajxZrxnqPSU=;
	b=v1wFITDW7Rh1emymFphUG2MYNbMO1d8c6tCaMLNxuqI/pAIHKwARkx2N4FOdmweZWpi9
	 mSVh31zcdp/NyY1nk9iiNy0n+PGGhrkw9YNG8c7+De5p00mBixAk60XlK2cXqSlVvBg54
	 tOD3MgxZRJFRLogsJp/OqJNtrVUgZdowNrpsCKQD7oz80n37XKSATxHEGffyAugFLag/y
	 87b2H2XjglcZ9/Y+uf29jeXmiTByFN1fpaBkEgHo8s9RXbWtsXttD0O1Poc/3tVzPqbe0
	 tS9Jrv+mXfAodHw9uuM6ZJtuIF0+A1t222c+chChpB2LgFn3CCV2fDDs5IHj4mtG/3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKWpjrfU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="As6pi/cv";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8FF606A31B
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A8FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CKWpjrfU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=As6pi/cv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAHUD1597388
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HAeWxfZTcHlKlNt7pgixx+
	1a1cs5BFavajxZrxnqPSU=; b=CKWpjrfU33uGEonVYMJy2m8zQoYRqjtB28+6Bj
	g+1KXTkF9M2PuBUL5aFsvI0pDLmtg3vgQU49/V8+QXimJjyn857YeRzv59i8pJkE
	mjJU7uWnhXy0YThoBbZqrpWZc/Ww/NZUnRnJphAhkNyYResyqVCitX9PxbYmJa9Y
	pZkky6Esoo/LHTUC3UMIEmuQdlsEXYMKuvrei9JVatBmC01d6YGINLv9TSwIEatZ
	p3O8hXl3dPE7OGeEhwDCjknZ4tBY7HPKO9zhwUH+i9rlBCMpdnp3/ntxD0rW7ZBu
	DmPGdqlUmVk8tADOMhNyYzRAeiTI4uWpSNP4KARUA3TlGPTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqms35ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so132414585a.0
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 03:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750453; x=1793355253; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HAeWxfZTcHlKlNt7pgixx+1a1cs5BFavajxZrxnqPSU=;
        b=As6pi/cvD8i/oeWN1vu5zPa7YGkISZBKPRJ4oKCN6ucEF3ONhwFjdnibMgXJHPKIKj
         78h46chdvLI7MJ4cwREFH3DvaKAHpmqH2Fgt+ZECQxeAlBXey46mrB6gW7zGWh3phwXS
         iYPWNB4Nr2gQBXjgk7i3Z1yrj4C76k9Njw7unt/kwZq7O/vip2dLZMzK6V+lHjiRaa8r
         u79Wl1pLKjxxB2J6sDUn0eDqIbRshbVHofaxt8JrBTCEq43Z2yM2d+KzDb9yJPosHjHz
         /CTO1A2pdYVfUeJ5RpTmJnHGqC7JkDD6Fk7loQU/8veye6RqpVND0Ew1xP85D57YeBXj
         UYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750453; x=1793355253;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HAeWxfZTcHlKlNt7pgixx+1a1cs5BFavajxZrxnqPSU=;
        b=LdvGJTdMLxKYGu+gxXq6vBa7Qyz6UNKtl/vTXfUQT8xdvBUez73Y/ulp9ffwH9nERK
         Vt7eci9U0bSbsdndOU9EwE/zusbdKsnfTg551vbmmIpN7jZTEBspJbWaFp11SdTMtVJR
         Lpaw9L8PcghJ0p1orzvAN6DfZTt4Xj+eCCVKajdTtEGDwi+JNRelKGT2LR8TtPALCRoF
         QswWQjTU3yzj23A7HCGRHT2uQrWk4vtHoCY2dgPnr4D+RwuwVSbKXyYPzOyQZolLCJTW
         f03uIACnakcjoIy4I81NGZCBpwtq3efDXObXUWqtk5Ao0S9F0M69R0bOt+T3zx+yScKq
         Tv2g==
X-Gm-Message-State: AFq9FYISZpYYZlzKxldksPf5q3d9SLvINRGJqPwskgHyNiklQv5g4S6L
	2jVytzJiH38O5ZjLx0fozKcmMLIrd+j1BgSkwbrClQjJ943NePUMWGNEW4XKTzjyNtaxGTPc2Rs
	Y0t7JPgJBFG0V5SPoBJ6cNhdHY11mujzd2tHWrYbdCCs+Q84LJ//Nzgkk0ZrYTXC9Xg==
X-Gm-Gg: AYBFou2P9KW2ZwgNR3kctvqoqaEy3yfogEY2OqYi1B87bX/Di9BMMjGFKh1FpNF0LGm
	0fhaYhD3WgTGmAnGMHH32sVzi3Uf8KM1zDQpx/S8QQJBSvabUJKJApW00PtsKz8R+Bpm6wihMLe
	FGzetbTvWlccnYDRkzaFnxiZugm/SWdfiGSyFv459B4d2K59SzHtcdnHylG0vwFN/4SvLzFHjNK
	iwkjhm5MtxOyHlBLEnqxw6KWhwOlDEd6y/seS5E4cw37OgnZ9zSfY/GDokdytqKQeZ/396DNRYo
	OnKhNDacRKXkJvXg9b/CZDGb9CCdlkW2dS1MMFvqHUVwBua9AEzK9xQuuOMhF2/n4GXtONhZBDD
	bCg4CjHpCFMlVUC+4na/ytkb/f32z
X-Received: by 2002:a05:620a:3184:b0:93e:c12c:f11e with SMTP id af79cd13be357-93f6f858af6mr297886085a.74.1792750453276;
        Fri, 23 Oct 2026 03:14:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3184:b0:93e:c12c:f11e with SMTP id af79cd13be357-93f6f858af6mr297883085a.74.1792750452772;
        Fri, 23 Oct 2026 03:14:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025da3sm4397734f8f.19.2026.10.23.03.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:14:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] driver core: fix unbalanced reference counting for
 software nodes
Date: Fri, 23 Oct 2026 12:14:02 +0200
Message-Id: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAGoz22oC/42NQQ6CMBREr0L+2k9olWJdeQ/DotBfaQKttlglh
 LtbOYGbSd4k82aFSMFShEuxQqBko/UuAz8U0A/K3Qmtzgy84oJVrMb4dl4Takro/GzNgp0ales
 JSZhamE6qk5CQ949Axn52963NPNg4+7DsV4n92n+siWGFkpr62HSan4W8+hjL50uNvZ+mMge02
 7Z9AYYbcyXJAAAA
X-Change-ID: 20261015-swnode-dev-notify-balance-e6f56fb9a469
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1509;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zrXlaeL9N8MVODImAgm9MbC+6h+IDc0akesuGDJ2eXU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zNyFkupV32iqUVoj1WBjC+fBLY9RFjBnMFWC
 XW7VVu8Vn+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatszcgAKCRAFnS7L/zaE
 w4e7D/44N63Xe36AQO4g64J2DMWqXw7V7A/eBDcagvc/dCyMNtUYHxrEvKLuZW3OwXAGSyWpJ9+
 ToQpq8o8P4jTVf+oShFfgmltGLKb71rc3KnPF0Eixa3TxKVbWLlKqecWbmBjL0KFn/i8aQOxXZ4
 5+y737dQfpiRAf1RUfT8gTd5JFZCOpchju6GS/tAkQDKuk04Ztte1ET9v4oil3wQktCIhV7LDem
 0RX9ouvu73wGWP4d93EicSOFZDKToZZvqcCDi2F3FojSEhk10JdfftND3GLJcs4S5HWEI5hxUbv
 b1hqQi+BPw8vU4aUoaSI74F2Y0akErUIkpEUpwD9ujc6qUfwe2RBB4JPsDoeZStfGlIL+hrTsAK
 oowiEGDtT+9vE6ucK7NCdzqpM0sHR6DwjqLx2P9uEc61IeZz1Wju/sB4im7/dO4Qolp0WQvRjsy
 mBCz8eTMDyCx/JiFFpyNqRv5lcpSxATu6nRsoSH63r4zGl4zSep3QtXAd0D7hqDCGEljTRsaavW
 HdFYc7JXbxDY6rnQgvvA9cO1GlqWVuBa9IIjIvowjfiGNcXnQJDyeVlKFx/IJUIctzDtLGTCXpB
 dkCxyHzlmpIv4EQv4ai68iON+mnzmfSqIDchj9j8ZEmcXUryOHGUU0WVs+SgfBKOh3aRnPHXu/D
 JRQsYEL4jgCWBvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfXzHxq1Do4+/oZ
 8Dpg3+sp4Vmpxw0YAUGY4yexmN3iTaA70KTREL4bBJqHzUSE/JuUy8fr3uYpFxU8GrfbaxPYaRw
 0rpwuf7AOM+3rAuOpSnGQfusjzv50DOSN1vSLAlIrqJ1K5RHn9YEZ5y9xFu53yD+xL1iv99IIM5
 1EdDYcAQGtScIZ1QlMxUMPj6QyY5xey0RUeoHZnIKwIZyFIbxcWjkr+h3FXOlGmxj88UghyHNP6
 3jjvYT/P7/HJRuXEJS7qJQ0GWHy6gV/0LBfjMfWHUETvSWB8UX4xFGcHHZYDi2v6y7n1KiZ8HCS
 0a5mur6LyKo/rKgPvSZMX4l2P2PeKKqYoNCWGQNgwB4SgQBlItUr93N/hEgtLQM5vcalr5g7xjj
 epsF8gMY3PRIyfv7btDaLI97e27oYrahMGBIPC+UO/4Q2yqV9wZ62T2M5EnM80Hx0azdZP4/QQE
 mMKTLKc6EsvkoM+lPYA==
X-Proofpoint-GUID: yMmNF8J6VgxxnvVsyVbbKDPGPJb6QW7h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX0ai8aJkvOIHl
 u6D1D3ivRSuidOrqjpbU3w2wGyYhiiLdDaQ5tvgfBtAL9XwMfugD+A/JVgQUer23cD5LGDs3r7s
 Ll0jn9cekMeBZgfhuB/Gt45xQtptVRA=
X-Authority-Analysis: v=2.4 cv=UdbE26SN c=1 sm=1 tr=0 ts=6adb3376 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=kTkK-H-Q3wn9DOHkRvoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: yMmNF8J6VgxxnvVsyVbbKDPGPJb6QW7h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230039

Eduardo reported an issue with reference underflow when setting a
software node with set_secondary_fwnode() and then repeatedly destroying
and re-creating a device. This is caused by the fact that
software_node_notify() takes a reference to the software node which is
unconditionally dropped in software_node_notify_remove(). However the
software node can be assigned after device_add() so the latter should
only do it if it was bumped by the former.

This series proposes a fix in driver core. The first two patches extend
the device flag API with a new accessor and value. The third is the
actual fix in swnode.c and should be backported to stable (along the
first two as dependencies).

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Fix typo in kerneldoc for the new flag
- Link to v1: https://patch.msgid.link/20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com

---
Bartosz Golaszewski (3):
      driver core: provide a test-and-clear device flag accessor
      driver core: provide new device flag - DEV_FLAG_SWNODE_NOTIFIER
      software node: fix unbalanced reference counting

 drivers/base/swnode.c  |  5 ++++-
 include/linux/device.h | 10 ++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
---
base-commit: bd1ecbb61afefc6a8b876ccbc31e9228b44e9eab
change-id: 20261015-swnode-dev-notify-balance-e6f56fb9a469

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

