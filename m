Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC46334A765
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518699; cv=none; b=fMHLOfw81NR3akeO2s1B7dQB88EM4EN1nBC80qkZgDZzes+3cT+8LvKDjXf5C6E62rlTvblfSuXeQa095vXvn+8GEul99Pg22H2n/6CbXGiCSNDisxhq5nsraujZAZr0n/37oXghM9nMgJoEENBOpomEIVT4udvl6h2ZpY3nF54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518699; c=relaxed/simple;
	bh=OXvGlh3LIuun63LtKHZFwnc5q1f3s01eombZh07coZQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m127MkSYAsWiofQBi47nU+3bf1Z6OeQDrU/Kcnz13HjNiWO18BeoXYIBX9q7LnPrTk7ruQ5Ee0hQm+wI9kPcNf4eQViAXrgzbl8qazi+pe+9M3ZBtT3qxD6Bpr191ly+RbJu1HYXNg+WceYcm2V/NVcRrKy7ldh+Aw+4LMA2ouA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6AQaImf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mu9n4J2P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6AQaImf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mu9n4J2P"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JDaZ5D4070776
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UPNrrdpFAF3GiC0Pp5ubRA
	BSGdCCD0jkzyTmumsM1Zo=; b=T6AQaImf/3DtAjIskcRzGba5Z3x1nLO9XgBArE
	PBxA20FGtgHaXa5nFK4F5BY5+zt7JCqykxbEDxJRRYwvb+lTaVDVCnB46bnzESFJ
	5WY3ts6nn/BTc7QcdY92pqEQBX61r/dNvxFJzXNZXvq5RSKkDga397YKOldAEle2
	gSEv68MFpRZI4LIS7ElHPV9yLT2qERdO2onPeTjBdwlU+F1pCdxAbSDHCX5A7lYY
	uMiw9cq2kg2YpbgewninrH8Puu+nKlzMRKzre89kXXe13zKdqlbozNCEO45B8HA8
	PPb0fxZh9BDLl45v3OY0WpTKatfhffWcV9R5imGt5zbkf2ZA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdtjy1ybw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5fd129472ebso9844754137.1
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771518697; x=1772123497; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UPNrrdpFAF3GiC0Pp5ubRABSGdCCD0jkzyTmumsM1Zo=;
        b=Mu9n4J2PcW7Wrz3UYh0FZtjvtZdCDNupwC7cwDzmwkIxFyA5YtGYkhy2VJGI9GkBES
         oQyCFGCPsM3Hc1vj/PlHC/czGJ+HThOQrrGBf3k9RLkn5rCXUdePE+hBZROL830wWGmT
         eTw2lYvkEtdf0gJ7Db6aM7drCVKacKBnEinjmr09mvymcAH79VC9e63ziuRxAlWmo1h4
         LfWC/SzcwJWZ8ObkokDjUp/Xz0Todov0aGAgKTe4h+lcdj3v/Tn5UMEFLKI7hQCI1bgj
         zuGQzit/bpLOoR+0/jp9qf3Tbw3kflzlPedyck4Bp3Guw+BZxq/ngSUAAAcQ6KMz2BPe
         Y12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518697; x=1772123497;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPNrrdpFAF3GiC0Pp5ubRABSGdCCD0jkzyTmumsM1Zo=;
        b=N02ThjAhyp+2WVPcq/2daSM52umPUOqCbvsn5NfN7bhMrypVkpgriDBITMq9+8dRyv
         xoRpGMtrDjqJoPfjN2UKz56xes7vpYQgC44w2qCW+sn3tztQrtKocseYua6uv4lUm9KD
         jBweaenv3GKfOtg9OKcF5W2UPGpQgXK/FmzqlLVohVAzN4DinJAcaeqoPHaUtEevHxaK
         sFEmwUQOmrRdWlps1R4v9Bzt7zPpHU3MkGnPorvy5BJspohJXWJKbdpHKASXz6oYk8y9
         PlGsOZtbPqpEpZ6JaybJYlHxjA+zPXgjQcEHN4TxXzRKvU6h9ZVZtDqdkqyGqfonc8z3
         Xm1w==
X-Gm-Message-State: AOJu0YwwegXM469R7cbX1ZiGrgx/5MnqPOh0yW6ugkxsPV1X27u3NYyP
	7TDgHOB/js7o1xYrzQli7VlhvFnPjl4PotgcmuXF+x3mkxGMzrdtbuX3nOcirLBFXUYeOkF+jS6
	gG7GDmX0JI43+HKyjTtdVerqbxtEVlrOFeIIjJTX0+c4gd2EADyG4JF+dLT6w/t61tw==
X-Gm-Gg: AZuq6aJ6TlJA/Ru57Gq1sr7T/HwV0Nk/39bhm6eQ8WxMPDp+merpopQewO/SvjvkW4X
	5kWKDh5r6kziV3DxdY19WA1oJV8FJH+YusBiQcpiBGw9O313fFQ8bfJlh0XQPcWGcFs7acGxo2j
	OgJOC3I6bpKc8Fh6A72euTELiyHANZd4W1a+UREO7BiCNPT3MSLgzwRuM2orsKpWzeYf6m6s0Oo
	yhqV6x0kyRWo166LtMCnHPlPVFoMI4VFVCU0jP8tcPNM4kmMo4akpICwF4r4CWmyv5rv3wveM3K
	fOt5WU5cDKgPeAwHYDLUksmppxZ3IHzXOEbhTV2g6N6QzbcFAFAhYlCB3A/OuuI9Q3izmbulg10
	uJLqWz6bLr6nOXBVyej4oMNDUsCiw+Y4IHYTpv1uPkakXu/LIoJmW
X-Received: by 2002:a05:6102:441e:b0:5db:d6dd:81c6 with SMTP id ada2fe7eead31-5fe1ace6532mr9326492137.18.1771518695474;
        Thu, 19 Feb 2026 08:31:35 -0800 (PST)
X-Received: by 2002:a05:6102:441e:b0:5db:d6dd:81c6 with SMTP id ada2fe7eead31-5fe1ace6532mr9326215137.18.1771518693482;
        Thu, 19 Feb 2026 08:31:33 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bfd6:96b4:947a:52ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm20272365e9.8.2026.02.19.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:31:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] driver core: provide and use device_match_fwnode_ext()
Date: Thu, 19 Feb 2026 17:31:21 +0100
Message-Id: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANk6l2kC/x3MQQqDMBBG4avIrB0wUZT2KsVFmPzqLExKItoi3
 t3g8oPHOykjKTK9q5MSds0aQ4GpK5LFhRmsvphsY/vGmhf7Egl4dZssnCExeJf+PB0henAnYvo
 W0g0Alcc3YdLf8/+M13UDNGYHlW8AAAA=
X-Change-ID: 20260219-device-match-secondary-fwnode-4cc163ec47ee
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=947;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OXvGlh3LIuun63LtKHZFwnc5q1f3s01eombZh07coZQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplzrb5/3UQHQWtf4+bzNfAFj0d/mKFKU4BTUjV
 EJHwqScdwaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZc62wAKCRAFnS7L/zaE
 w5VJD/91vYWltp7GEUgBtfnS4DMibJQ2JOFQgrna0QYZIQB0saf0Y2N40Gepj7kUao4RskfiEFb
 1Kz4BRJ8RNK7j1o2G4Eo767ICJitUL7yhjnyaohf4y97KqhuFF5u4w06O4PPCWK2nK0ZsfxvFcT
 dYGUnJelX7IxCqc5cq8+AVf52GnCRQl1L81ZwzA9JTLFPV4VJ0kmhmZwwYGGAkfxjbs4vLml38c
 U3QhkY/Urm3LcQyd3QtbQIHXtYaWx8Mm05ZyVCd5XeanEAhr7DeY1Ao6lOglAFnfQEgxsIPoRBE
 CIaFo07gpnjYuihUvf2sDHvUyuQfJJGU3d3+nhS/b2djfPhkZXfRLc7jsEG24HODDtypW2wI6Gd
 iHjykuSwTDKG5d4vpZAbDJyiaHe8q+5XIsEug7QsZuWfxo/b0D+Jqq+hkaAdgm+yGENBbgT6+TQ
 XXvqNmPuDMAx+WMqJ7om5+RHWOmiXuNCgXF0O0AurZSeXkWm/Q1Dy5nSM5sPAD+TPBjD8lUZ5pL
 TgstbvM3OIt3vmOKWXloSi5LYKYECV1GvchpLLQjyXL/fWlMNzqoTo2XMSO0UEULb3j6P+/BScY
 art7CnKpuh45jvCYV+zFcJbgrdr4fgRpg3oQuRvR9RYr+5qHal/iEwTAhlcMV4a2UM0eEkhZ6y4
 3+pViHQXuaZOdyw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0OSBTYWx0ZWRfX5lTRFb9GQwJ3
 2glhiAKZVTtTmPqPsMLiZ5ETiqbGH/TXeY8oErBPkKDrTy81kVaWREAq9rPw3V61qGxYMbOuS+s
 615ctF2XKahvxf6q+cNzJjZAyaRKohBxAeAIzTODQVKARljmyw6lsDOyJbect3M1glMv3RPUL4D
 P6oqQNYo3pkUJ31usM+9oXui2uNUmSNx6ZKcon8W2bS7IPxV+8GGSya76AvudcddWUBtuwjQ7JY
 HlNbJJX2PigHnREuS2cQh0OoUbTHNqcLyjzmH/21H1PpBQ6PkgX6mNXhw4KHGRlZ4+V/ApJwtvT
 uaEihMk6cz2UbBQlCygYdNGLTEiOr1RNMdCvoAPGfbdJ43m5odckt53jla1TOllGtxhFAVcdVCu
 XRy59a9qICjvBw2KV/+vmc4Zo2sh4aoDzZuKX+Hr8Wvd1Y3fElV1UuKcT4LWwvgrP9dhmO4aiel
 fBariy00+2OokPe9YQg==
X-Proofpoint-GUID: STswUNU49iDWNG41BnGCJ9zWcumwP3gz
X-Authority-Analysis: v=2.4 cv=FoUIPmrq c=1 sm=1 tr=0 ts=69973ae9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=pifG940BjlHurnhQwJ8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: STswUNU49iDWNG41BnGCJ9zWcumwP3gz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190149

In GPIOLIB, during fwnode lookup, after having resolved the consumer's
reference to a specific fwnode, we only match it against the primary
node of the controllers. Let's extend that to also the secondary node by
providing a new variant of device_match_fwnode() and using it in GPIO
core.

Link: https://lore.kernel.org/all/aZUIFiOYt6GOlDQx@google.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      driver core: provide device_match_fwnode_ext()
      gpiolib: use device_match_fwnode_ext()

 drivers/base/core.c        | 14 ++++++++++++++
 drivers/gpio/gpiolib.c     |  2 +-
 include/linux/device/bus.h |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)
---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-device-match-secondary-fwnode-4cc163ec47ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

