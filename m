Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A8B3B4E8A
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775821861; cv=none; b=MRFbiw6Gh8ODGOSAsnoGehaaXXc5TCRhsm1XNRLDlZH7D9w4OsyxN4tCF2Bhs4i+b4LmOHry6n0RjhSG9oILhPtvPZGIewmTzJMy6HfmeAwl1nUI1aJrfujFFncxcfgVZ4KSErF7CexleG6/NqRjJTcgi/DbOg7gM+arAy12tPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775821861; c=relaxed/simple;
	bh=emZ1Et6VECliWEj+owZJqr9bXGLhZS3qk2EHEcsgQ00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IGVbzr2+IVLS4vmkF9fYs1WbcyD7ZYj/KTvuI6tLJepNofiQr0pZJrb55nuvKtvQW7YYalNXlaxNWdQ7CTFKJHmA1U8sK16gsXLqP5AHAIjXi8i4prgJxybFD+yY1dTZ86AZ+6/6Bxadg8ZoCiyUe1+HZhvgRGF73loF5jFZv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXqOMk9R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fYVX8K/F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXqOMk9R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fYVX8K/F"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAaYLI4148785
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:50:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2v/e0ORLN97342ydHytdXTvqiZeEjtaogMIN+fUKxE=; b=GXqOMk9RhoNdN/On
	8E/b4avi3GRvex71Z4+FM02lGz8CADbuDuSzbR2bf8N30SQ1EYm6KNmdIMS+SP7p
	7bP05+oYvmB4orI/pjR5tw9PhXgjrCXDY7elsszLD7cFPyCdl2g+V3X3Vi+qcsaU
	q7Pl95lS1JzwvN6ohk9C/ck/OqkVL8hvogH4RzxrN2iNKoylE3RZP8JCFK6gwlFm
	OwxnTmuKg4CBwq/j39e1cV+NmflLY5C9n/3ikrSsKsto3dEY3QmAcsPKlwuBPh2t
	+KwYgukhG9NmwLgHIuhVxtU3zQpXAZCeRI8U+3kIz8JG/099QA+ECHWhwhh8lOai
	2UZROw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgh7bs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:50:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso48738781cf.0
        for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 04:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775821858; x=1776426658; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2v/e0ORLN97342ydHytdXTvqiZeEjtaogMIN+fUKxE=;
        b=fYVX8K/FrTrhuar/j63yrIt0bIMN4C8oOk7F/b0UpCM4+vvwD8CnrdW1a9g3kDVVae
         h7jmaCgX8iVBei3caVlW0FnF3X8pmMl+3Tv+41MTMOjU+UJ4Ea8oktqbnRRV2D7JIqT3
         SdJogJpZpAlRAtYdzwEF9+33oMRHg69d6H7uyFFFKrgHxJUFHQJ7u0zk4QnhWmYWSHXI
         cqZgybKUm0fqz7DFpT52l0fIAnC+jwlJGGAO83g74vabdB95FTwxNSWymfVErJI6Jw9U
         g5UgcM86qWsJKXrO81cxqj+PT1HCkG58Z4JROHgKa11+eAYu2QQjvvVwrwxc/VjQWi0D
         RRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775821858; x=1776426658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2v/e0ORLN97342ydHytdXTvqiZeEjtaogMIN+fUKxE=;
        b=g/c/jQOdww7I6Xu4a9v59g6ALDFwIF1EA1MuQV7NUZx2Zx8yEB9mlJnoGKtrclUSRH
         bPnAdpjz0CoVQifBbfDzmNyuE2ASc7/g7Z52teZorZbIsFjz6wWfgPh5oDS2/Lptiw2b
         LHi8k997xsjpF1losiDCpaQLev78ROHjl/FYxILUQY6lc0Qwi2PEawYGvMdtoz+7pMW/
         gFzVoCVtAOq2ZAYwswxHewczN5xPwj7luOKCMGedsyk+3F2whJMVW9lzRpRJHCzw+6EB
         ZNHmvKjrpk0oAzlOjn5N9Ngabd3IRG2UKXM8rzbbgDsUmK+CBrj+1PJOlhfTLwP1BLEx
         pSdg==
X-Forwarded-Encrypted: i=1; AJvYcCUKdolY4iP9GXTUwU/lRoTIf+mFDi+UFZLxKPXsjRyq3bHQf9NF4y0IPV/YzTz/Kg+gI/Zr6xsW5GD6CA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7qGGnfDhltN+4O+VUVBXBzOjjEoEra/n/Rq7jtBrz4j2Iiir9
	i3zCNHx2xO4QmyWUDq5qfuZZ9yg0E9tBGZZrO6qNBQDly6H2hbWdNkOjncEEbPV4Sz6yuM8lnaq
	jkhuTbxlw3hY2xZYf6SZP/fnfqnyVHo5eW/c3VbE99+UMCNEqQA6CQhZl6oupICe+Hw==
X-Gm-Gg: AeBDietHSRdbzlGXoJ1NG35ZkWtI3AV1WPd/SV5kQYG2ToFY3B3jWXcs25LkrnB98Ed
	fusZpwPHAwKDn1mVa+kamQNZnvqGJGWfwRRwrUtDQ/j9Nzb5gSoXDyO2uJnztbeOVl9pBOhNc9N
	Ri/RK5Bi67xev9RGDydt8BsJZne8ZRogI2JPnBBq/UwFEPHNukW+6OTtsGYWDocjJ6329ZIPcYp
	bJ167Lf17MPUFQWiOAWIGc4hthR2Upw04VTHmDy63HbvE6D9pTmLskW375/PzGuX0sO3+efqksR
	T9O9cPMHPWVsFw+iuieYICZtd8eiYws+eRm18cx7fyEIQ3r12j4khjpVvWQmKoJE2twbkBfls6H
	zoNZcYLt6g1JB2+vEqAHZ4ZPNdW60dRw9lCCDEuotCttF/mAItg==
X-Received: by 2002:a05:622a:4009:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50dd5ba3bd7mr38857261cf.42.1775821858148;
        Fri, 10 Apr 2026 04:50:58 -0700 (PDT)
X-Received: by 2002:a05:622a:4009:b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50dd5ba3bd7mr38856831cf.42.1775821857705;
        Fri, 10 Apr 2026 04:50:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47f7:9881:2ff:bd1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63ab84cdsm7019329f8f.0.2026.04.10.04.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 04:50:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 13:50:45 +0200
Subject: [PATCH 1/2] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-swnode-remove-on-dev-unreg-v1-1-cd7d305f3db2@oss.qualcomm.com>
References: <20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com>
In-Reply-To: <20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=emZ1Et6VECliWEj+owZJqr9bXGLhZS3qk2EHEcsgQ00=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp2OQcCbaatW/wFZw3EpY7/CR4KecO2pLjgt+v8
 kyKSq1uupeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadjkHAAKCRAFnS7L/zaE
 w3aYD/43kn6UD4VG2MiUjWd4HIWZ9suzr00pU9el8bU/U7xFeoes4IOA2UoPy288hvCKk+p0hs5
 UrBGWKlWY3BmH1yAs167kSrhbUtV7oXAlLpQV5Synb8cfTFhUYANQXAn0S2TFOU/trFVgEuWF1b
 RKHXmT+f6Bo8ETDD9GigK6i0CTCS/GqU1sZG9ljUEN0Y53fpNZi7n+DlgyQyz090nudgbC9/pSp
 rFF2Z76f+7fZV2KqlF6pYw0X+FH5TD6FZzDXrHKG2Jqm1WpuCbgkoJzGf7ksL7Lad5OATx2GaCX
 5kpXroZLKHhlucO5jzPlrSn+nGcruuEvVzayKJnZ56glOhIHHb35bZHQf6Ot3Ob7LyQS8q5YWg3
 b413PFmN7fEEiqaLRUprWL2lgEYU2pX6Fp5nZ6xQxbuNxb0+0qUZZhG3JeVHNXOy5jLc/yLxXbo
 pdB8mMUpnaGzLWe5EJKy09AhiO15HW3XQGJDk4Uv5WFclbSmwfTzxkxgj3JUNwDgJuzqf0EeF9c
 WeyE7UVGziC7C8Tme0Hsj9CpnHEI04LNYXH5RcRC+Wx7SSaZRiLcAMGTc89/mdbbs/71xSwTDNB
 vBIZrt1LsHtYC2xhydTOZP0xR7+/xBO9BO0P7kmu1ZYDP9WMpvFfcXtjVl8vs40HgycABcIaQq6
 uyoKztGpezAOW0Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: SgC5XDsiCnfPCBBgsZsaOgZceIRfoRSr
X-Proofpoint-GUID: SgC5XDsiCnfPCBBgsZsaOgZceIRfoRSr
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d8e423 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=Qj4d4BcRTDQS6HVN2hUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDExMSBTYWx0ZWRfXyqiEryC3axHK
 R4dy+f0KPB/Y2iaVigosqaPw5bKUgI92zTzXBCaYmLtt2qcdMLrSaet8dy2Nv5FCJynw6xCp+4R
 PnY7noyO2qfPANy2eBD7inhjE48BLLCQpx4aYMFCpGJmVzeD//uYEev0+qdi1RqhxRiB8HKftij
 TGySKgnwx9zDyd2rkf+L7WmZGtHqOkrM90qSQRYn0R0mwhO0+4zWKvkjbSp8RKl5Tg5s4N6GbxP
 NCCEdXBC7wr59qEa202ZecZcDNbevKISk5yCsm+GKUuHvF0TAC4UA7QldBs7BOSVosOhWAHYV2q
 J8GIpwo/+S71NNQMAZp0yrjRCN++UoqHVNDYyEK75iNAIaM4lMvpZv4CBv56zgNTtec7bENJJQN
 Lv7lNHuqTtV4xwAFBINq0vcVev96jv/Kgz/wowgZPiYPv0554H9h7edPPfKplNIJEeqshL2RabU
 IFL5plc3GMLUqOv/zNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100111

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fails with -EBUSY. Add the
missing call to device_remove_software_node() in release path.

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e582e67adafa78c312d75c72fd654cf..a442abb4f1028a91f3c56b51211335678f7f18a2 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -600,6 +600,7 @@ static void platform_device_release(struct device *dev)
 						  pdev.dev);
 
 	of_node_put(pa->pdev.dev.of_node);
+	device_remove_software_node(dev);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);

-- 
2.47.3

