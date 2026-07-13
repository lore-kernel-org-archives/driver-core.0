Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C7A387569
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941319; cv=none; b=HPgFzI26Hnq5uKmzjwc4HIjx5DkmgF/w3u4Ty/uMbXpYVlwPDEDX9g+wH80T+rKHCKpDlp9C3oorVeCkWdHYLkVHggtejG34L89C+vDNi/DsJhMI4wwEJwJE3qb/FkexZiJrocCKwKsHQzZSppZpf0zINn7HFhGBKEMnQqji62Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941319; c=relaxed/simple;
	bh=W+4x54SXHSvmG8iNR7zCrefhHtiBz/ghaUo8GDg9VJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gWzWW91S75KJ5gpzWKOoqEKLKtymgMCpEh1RdWibA8CAJdU+k3ns6dMA/yoDaW7nzshAlEgm8Gumd2IHACVxwBQ6vA7PziH+uagYjAoGYlstJ0qwTLSeYWlQ5E9IjTvbpV35pvTlCwhOZ00pjaTy+JhHuuRt8ewDkt1rwI8RdRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JD/KNSWn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=breG3A54; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JD/KNSWn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="breG3A54"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7Kupt775882
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=; b=JD/KNSWnQspOuGRL
	zJfe73pU7DMXV8BzPKic7F7jAwWshVjoFiwKxOnShbid/YqaUDQV8owzwHr5Dj/2
	i096Ql2A4atVxGvut3zn/Y099c/DIogel07lgYwRFbKhhPFls4R7STFF/hwiROeS
	a4XVHMLPjqdHuzRwSLLrZMT7LkJm+aj8v/P6xSnaV8KJA4wOjww2aGXqCYIVvb2z
	Rgfls693TApsqMuQ0vgZWYpYyfKuimfKLdYP8XNkJ43ssyH8lMpcv8t7rm/ZpECS
	MKcYAhFjrRXPuMOr+DyUQpVINzWbRdFf278OD8P/dQCxBkc6rVqYDTe7IoWtO7hA
	SDKl3w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00vca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso28274561cf.1
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 04:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941315; x=1784546115; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=;
        b=breG3A541wP911Q9pYCdw0Y+p+P5a7er7IUJaDjyt9zqiI2UkqZ9eOK6/hDm/9d00k
         4GV2PmQ2VGd6XEDgviStBml/iLApqzOs16GtUiwVc8MSkjnzqoLWMDEBAtXKCvJNKjN0
         x2qcKd3KRyAGf3a7+OfenHmBGOC3tNbqjkuqlTVyBnKKRl/cJGGSOJw4E13AHlmk342R
         FzAtytD5dw0OOIr/7GyxYLqinENM7AHCQKxSpUhkvLf7a58l3xKwuD4ORcTSj8Fi8Fq7
         0hFS5EXtP3vyN/c5aAf2sfUS2oYVZiTiovljxhX3pqQCs0IhSBuIk2tjeDLFqbSANosd
         c4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941315; x=1784546115;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZpBMxILdTui1a4fiArtZqZbQ/ndjLRgPSPN0AMlFLU=;
        b=qNO7Xt2wVSfubSXxOq7qu/V5kaa7YgvIVG75pxZbzXkv8LE3cW9Ise0Ei4dEDY4YWg
         AhiDJ8CP/iMWFnGHVsR1EPCecxYOu25OOpRi0U8igkgEUdYwNpbJ0KsehqSItjdcNejk
         09q7I1fm+Zh++T3NEsRHnJs73GnceWAXsDl0fKH4LX4BVDJYgetvmJY2L1fVGGT+Zf+h
         XDJTNK2PzWRylFIZsVNH9S0FntdnDkUPJsopZCZtGfXWxHPh1m/5ey69q7jW59yBNkYa
         Cgg1H2B2/np8OhLjpOTV9oOTWsYpXCY97KCZcZS9qxXdkSoW92P1hKvJysCQiGfRElu6
         blFA==
X-Forwarded-Encrypted: i=1; AHgh+RpLD9KH/B/woEgiaWvU7oulrEkKcy/LCSr6jJH5k2oouTVMu855+tRByoXmAxu8Bf2hWAEB/AgtC85o8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyC6GB5yONH4s1CfRyBAyevRIqUq51kUU2V3ekJ+MPvATWX6Q3Y
	PEXXOn32W1F11oqraNIDA/nWgS4QoG8A0uZgwdHtnlkNSyZL/XWad1nq0oX8p3stmux99tLL/nB
	BFUtY6E+OtbfVFLrrfBU91vX778E5pUBxwdZEteq6BTpbU8hkZTtzN5IiZ1foSuog1XA7dPN4jw
	==
X-Gm-Gg: AfdE7clIUzJ090h66+Foo2mOQUlpVpdi+4PXYGYN7eS1PXKBt90coqceVAPGh9horGs
	J8okKmeZHDpF6g1gsNBOrgRu/hWDfoG1qxnzihrE3906x6gqpeAmlB5Xev49KEzMhCsujMhgXE/
	gL0h11rTLcX/ohN3gpBsRYHj2l+kl10DyevKWh3gxgQ7yeBJ0ANjG0F/X4fTz9jLA0ciDgPzhjk
	Wo3nMhiZdaLqViRsxGQsT2jLTasOl+tbdLfHNDujoEodNAnQ/FrxBoqqRLoWo1CUxMgdasAPw/e
	6pL8YuQQgu1/NUTvRwnpEkuq3p6s8/GKZY2+qXlNLpV0a/EKSvHQJJ8f2FQ280zCa23oGQnoFLS
	ivaEGn1+Kf3u41OHeIwWEITddob2TPiA9qgallkqJ
X-Received: by 2002:a05:622a:5513:b0:516:ca56:a44d with SMTP id d75a77b69052e-51caa02e1c2mr128571481cf.6.1783941315141;
        Mon, 13 Jul 2026 04:15:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5513:b0:516:ca56:a44d with SMTP id d75a77b69052e-51caa02e1c2mr128571201cf.6.1783941314689;
        Mon, 13 Jul 2026 04:15:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:14:47 +0200
Subject: [PATCH v4 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-fw-devlink-v4-4-d4f2dee27ad9@oss.qualcomm.com>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=897;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=W+4x54SXHSvmG8iNR7zCrefhHtiBz/ghaUo8GDg9VJY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMiy441BqBZXkzBL7+gB9+mfFhdM4Y+nxwH32
 viBbBXLEfyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIsgAKCRAFnS7L/zaE
 wxGbD/0XjM5SUCmLLr0/CpZ2O4eglSDLMnTe+PCk4WFrytuv0nkkklMcmuO/rXJ73ryMSYNRsOz
 gw6KArw5En7YnHt/oTL52z7uiyj4Crm7aN1M78N78Dw3ltpUv5keC5V/vexaXO0+YAZnqqr/B/K
 IDoZVdqTtG9O55r2/ChQmU63N6TsDL6nsC225TJgpjHwJ95QOONzET5WM8Io+t5JQREjriZOyUl
 HJ8Sd6x9jliHz6ohBhFOtQrmjvgpMYRJL/8RVK/zqd4tRS3NStZ/FzM6+bV/RgcYodKnt/Zvhtj
 6qwc8OE5RxpkWiB1RqTwS5p/aeH1Q3ys70ZO1xKT9Omny7wncY9zqr0//PV1YhhSRw5FZRSt6mi
 d5mQx1dmFMvgiZJtpINX8a87qPQeulvgfNoX6RMwyA1WeZ4TvSU+fcSYzJRSsFgpKGg9r4nDKSG
 40k9iaOplZDo3y2kL4xIH1zMUfkNNAekxbIbsgPm5G4jeQa1RZjHoE7pm69aEiH1w+CwlJqEftC
 GLybrwHegXBXYQmIRMmlLFF/xH3rEYB4W76O2HK/S3V+nhowH12umt6gqY+vqwCvE9LA14DWPt5
 GDGcYc5rzIx1N/nDxqwrRO5UqH0mOgIqo6yVh9FLjFhnqKE52Gqd/4DlkO8KVfoXnfNP3z8o85P
 iAOUf/P3EMQZU9g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX90fKtrSUHFyJ
 jNHhPNJa8zZ2AlDBBG75HdTuiCUVplbw8BVI97dTg0IrmVMTu46YhpT9+6ehhDZTQdKP1T28Flr
 OLwkkLB1VYTaIc2Bacy7lNIefIBuQTw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX+kyh/GvA0221
 ga2dote7Wuf75K0m6XXUnAKoKTJaacnTkkN2o4uhytAOPX+5D1Xj3PTT19Q180lKOZFk+oAKVoX
 63duymk1IBpciu8teF8CXHnZJmP+cJDDwab2/XVXIMvUj4uEVQAVX57J8BzBLId3rSqhynuC2gy
 TXm2dHGhL8nUuvR0m02+cQ0ZHzQvKQ4XxxLtrQ9S+EAFMgAiWG3kBhcQVQRi9rj7kn/KR92Izsy
 20uoZFvSjcDbPMEn5RHa1sUP8Vt9Sw17BioLTfMsRXXa3vTyqMrjA9FcNq9PlMYJFnKx7BBTTHQ
 iX+hePULvmyacxrYgeq3YHdV3sebp3vFYcPiGDPDBd6zExe97rd0cqIAJzyG8td4uFOVDaSQNbO
 wCJCthcVDUtTnokZcPbLZZQfbImfjjPlePoItzT0m7Pd4Lp20Tsjss96jGrSFJqebgfXnbMdnfi
 9Gc9eJiuWhsLI8Y2SGQ==
X-Proofpoint-ORIG-GUID: aJw_3HoJ0ZpbOma6IV6JDMFXI5XrXb24
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54c8c3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: aJw_3HoJ0ZpbOma6IV6JDMFXI5XrXb24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130117

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f9dfb14b9d477fc0331441f96c158b0474f63026..a7a5d81d30658700b3744e0b2994211d75074883 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25102,6 +25102,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c

-- 
2.47.3

