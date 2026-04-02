Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8213C344C
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134495; cv=none; b=TYav/VOJgZfRUxQdh0jBalou+YFUOr1J7B8jMKId3pWO4PR2durYfooHkn2VD1v8FDQuitN7zujUAHyGaep2uq0DiNhG46LoCJDcCnGhql4K7aQAtOs3J42GGQVJujIDv5gLEQR9ntLvFFP52KFALluG8U7Fwr8Lnq1h7cLi37Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134495; c=relaxed/simple;
	bh=UyVNL9BnEdBHdX0N3vE7Axbnavw0KwKZ6JYxOrxh0qE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGHHy8VLcVVlkEHp+Vjgrulo4dZI+NBWEJn5LfCXGuqwSCeOJDHryGu8turrYRJRggDTSn3P5BZcrTS7Zk8bBRmJTYy8W3oDJRpOkn8jUAJYmm1GV3/YW1c1k1D7Bwx0f8gywjvf5oW+E9V2odJrIniv+3raF5ozVFg9ogT4WRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ePkQ+ZLP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuiZGucM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ePkQ+ZLP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuiZGucM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632ADCvu1551206
	for <driver-core@lists.linux.dev>; Thu, 2 Apr 2026 12:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkL8PdXGCakocYTcwKJcJZjn9BQ6YHeW55eR2rIFD0M=; b=ePkQ+ZLP/FEEdUqP
	H6rB00iOq4YkhjbsYVp2JtMsefxRY7b0V9eVTf3Ez0WZAV70+m0YTiwYG8nNuvIF
	iFul5qEmOsylzEiBKDDnGMQh8NleDFmgi5hoSil74IlJAkSh9iRWxyF2/ZKf3MaP
	1ideIovgSzLm5CWcYpZDZHs/PrgafdP/j+2+Hg9JzTbO2YOIPDsRb9tE4HOqEWtS
	p/rcKlKUVTCE7n4KvLl2oGdbXISZ4nasTbSwoFdzIxNFnajbUZ/aIW8G45N0EHSp
	2vYMAQ59TxBMh0iDTXI/xkCkJEkZPmwhK3+sQziaZet6rrYP2adYw/OZrzpAr281
	tFthSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heet2tn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 12:54:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso28019501cf.0
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775134488; x=1775739288; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pkL8PdXGCakocYTcwKJcJZjn9BQ6YHeW55eR2rIFD0M=;
        b=TuiZGucMbPNt5k1W0QFzSogv+E2aweA9MsgrolndTtlNLzxbXAamRhQ9cAT22bMfTv
         i6z7mdByAn26VC1giBW8yudZwgNUg6a5NIWDMR9p4yESfm21nypbkHX6FM5pV48cFa7V
         D+3rPCPebNFS37U7IT4dtQC1/ZKPwQe8+z422jYX3Z0+z4XYkvlaZEco8W+FNPHAsauY
         5JHqYadNHvZhEkLPr9MbS2lLNdtgGkHKgcY3Q+kgsMO570k7J+AiCvMA3/hbrq6vvQoK
         9tTfkcncoa+MTxEIPUUaVsBD2fKDAr2htLNos1g2CNlQPe7oLh5xbh5XL8V/h224FJtQ
         91Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134488; x=1775739288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pkL8PdXGCakocYTcwKJcJZjn9BQ6YHeW55eR2rIFD0M=;
        b=OUCfIZZFyih6fBL01/fTPtR+3BDYa0pSxFs69zNjWGoY8F7nxg9zd9ZzRvf8TIAIVk
         yAKjqsbDA6ZHQrM23Nv0ezNJgnp6z3R4Lgc32LJv6rRYIiaZrwO+6pVQ1aK1e7DTKtSn
         zkOsgrOiIMryQ3vqJSFFrm13w3Z0uFg7i/syxrg+MOI4uReHOyhskcvBiBcTxzSZENva
         OVy/gxy8y0F7LzX8Y71hMFZ1vsmfns10H1BnU2r8bIn/FWdXc86/Hme5R71x2YtGXCZb
         ECuGBklBLyp+d0rk98YMs7NXIlfIEwty/NEtOin1fIgx0z1Nm1yMDSZmve0qAUvjxQ61
         3w+w==
X-Forwarded-Encrypted: i=1; AJvYcCXrpyfBnirt7uzPqtoKhmCThdpunvCxc6LWSwoi8rGeDRO1I1VgvPqaKML5/LBPWEJJo3f7kNp+tFqbMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxkMiM2iusXbnhILOz0Ip4AieG2mqQkf2niUMYR9suGUP4KVukM
	V+S91bVQFoLJ3A6w2yh3HG6J6S5AYMDmu10lTq1rB/wL3jJXZp6lHTqlYJYjsVoGAFn78H2DzwJ
	hd5yUeizk3AiwzwTAP5LExSSVZvSuOAJ8X0ktA4jjckCbZFiPtk+M6JhnYlB6PV0JTA==
X-Gm-Gg: ATEYQzxKzbBNYTRHbnzDMx2Fedj2VATibIt4A+k656KvTAg7Sa8Crus6cD7xSOZmacP
	TF0mCPRI013mAT/iHTDnUfFzCz3ypl+yxj4LTR+WNiTdffbWm3lKIn2AuiYHwdaWYV2btIungFZ
	6ZEI5ozkpCQk/2/cZH/rV4wvzgtx5hHMjDW4YRo3r6Y+naWopDLmwzuqmawCq+gcd+VagrbR86k
	NTB3XYirtMi/gV9lGWMC1VUgRXoOkxdxyf15OI5W2N6Kx2O6eSU3MEsIyAeRSfoJBB8OmwLj3/Q
	MmFOibj2Nh0J+FlGeJ0v8VESE9ifkg2NC9biTl3KqVvtpn9zCUsch8JerU2kS+vpwOkem/rWB/J
	53kfKvsBNZgaUJ6cq+XLONfVqrvB3L5AycJHwDwI3Nzpu1rkcHtpo
X-Received: by 2002:a05:622a:a6cb:b0:50b:41ec:5e84 with SMTP id d75a77b69052e-50d3bb64de1mr92118121cf.12.1775134487699;
        Thu, 02 Apr 2026 05:54:47 -0700 (PDT)
X-Received: by 2002:a05:622a:a6cb:b0:50b:41ec:5e84 with SMTP id d75a77b69052e-50d3bb64de1mr92117751cf.12.1775134487297;
        Thu, 02 Apr 2026 05:54:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm235790765e9.0.2026.04.02.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:54:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 14:54:26 +0200
Subject: [PATCH v2 1/4] software node: return -ENXIO when referenced swnode
 is not registered yet
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-baytrail-real-swnode-v2-1-6f5054a4cc07@oss.qualcomm.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
In-Reply-To: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1371;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UyVNL9BnEdBHdX0N3vE7Axbnavw0KwKZ6JYxOrxh0qE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzmcP+BIY8RXS90a3xjPBNtfvQM3pMaCvv1JGW
 DHGPZ60AjmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac5nDwAKCRAFnS7L/zaE
 w3c+D/9KXhdti1SkyEeKtFYP4j7R8J0b/1Kk6OkPjGG7BRkDpTirvmAyIzGLElaHdSVbHQcPO74
 DCSwW+mnvKHj6K4iHOHP0rF2HbRvmpssqmUzxXUtZU66ePHgn7e+KFt8a3KtTwUJ4AirsIvv6wU
 oumWwMV4qVfAHVWQlL2mI2jh8guD45k3hLBhzk0JZBCwY7/6JeWmHJn+F+bws0i6SrSq28+dze5
 hEaf6mlV6rlYCRSWs8IqPSPEF2fRl3eKyEBq6Hj/tlQrw5G2JkYIUbPWcSV4WHi7oGmvXPLaP+7
 SzI7yLSLRk6KHMnSO2IcR3QqWoVz9goR9rQWcrnrCT2QoDVSyCG3dXG9H7WL+JRv+BKhwr4Mgss
 X12f5wJ3DgkvsRFQOyXlr5x7Tm5i/yZVsVDnAwv//syUuKfJ4F/NTuoRA2nC+AZ8oY2KVEkSCa3
 CL+s4GIP5epDDogjQrgsSbpKjyNROsAs6JD64+1zQlOmo0LZrMaRLHXFqZC1+TGIHTdoyrHaPZ0
 YbEsZhIa6Grt2aGPQSVXMGrPHzAlajh/YOvhhpBI0u3ST9CeMfhDq4vm9Zec5wCgOSr4m6cyEDW
 CeXrKv2STM1mS8Dl/A1gPR20qWh35tQfMUs04KGD35WViLkKWqtXRNu8Gk+Wad6BMBh7beGmHXs
 wCaqRuxMx0TeJGw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: A-zsKVW_TjwY5otY4Ojd9_6MhJNbYM1A
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce6718 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=WW6vG2jIvFMNhbJRSCoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: A-zsKVW_TjwY5otY4Ojd9_6MhJNbYM1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDExNSBTYWx0ZWRfX6aDL5uqvT9UH
 D4YlB6mEBZ7GZOFYeczA/R8jFgM3Px38rBm7W0zYzep4q0smS9UWsrVqTYefkCfk/9pQJ16Cdx0
 sTOK10EMct80R2RsRQoiN/NP7Npt62tNLBiaPc+fGizuRTHRg47CbFCsgQPXfBXenRsm4HPCkZq
 wP38eDweVEh9Uc25QwJqiHZHW4qpq+VdgWhofN3+pwJ1sN+q8zbVmB3gQQIaG90BM2HFSv75jqQ
 MfBncv7ohNxjaBACYZYoMDaydU8lBQbVKjox3Ogs3rErCUixb14bV0+vr4ZzF6MOlDAq6LgQxy9
 RXe3x/ySOc8Y1OGl/1BetEyObtn2Bpwh1doeD9s45Q6itjIS2PPIG9ulBp8sBTm+rsqLhPzB3Ti
 6SizagzTxgCPKU+E1Gj60ZK2JnXF0ZVeiSLBdtB70QGykEkv1vqLnyXWMWDSLEO3sp5fw/WQzOe
 gmr1W6+sfsSyOyYXAhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020115

It's possible that at the time of resolving a reference to a remote
software node, the node we know exists is not yet registered as a full
firmware node. We currently return -ENOENT in this case but the same
error code is also returned in some other cases, like the reference
property with given name not existing in the property list of the local
software node.

It makes sense to let users know that we're dealing with an unregistered
software node so that they can defer probe - the situation is somewhat
similar to there existing a firmware node to which no device is bound
yet - which is valid grounds for probe deferral. To that end: use -ENXIO
which stands for "No such device or address".

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9f1bf4f65aa161d9b941affc74936..29eec7ba500e8c8a02482dfac68f2c313cfadee7 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -554,7 +554,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		return -EINVAL;
 
 	if (!refnode)
-		return -ENOENT;
+		return -ENXIO;
 
 	if (nargs_prop) {
 		error = fwnode_property_read_u32(refnode, nargs_prop, &nargs_prop_val);

-- 
2.47.3

