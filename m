Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD55438491
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 12:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342485; cv=none; b=PyfebJzV8C/hmUYlhX7nlfNB/B2GxIU1Wkpp6vS7tmGDBn/H+NDKsHRVt9HdYUvsomYSvhdZJgzFc9nk05PYr/XnOuZJK3ek/xVFEm+UwHl69d03PEZeaOj6KrxN5hINeorPcafFvV0PoxSiQr4iWVCJsH9wxUGzmC37V/962a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342485; c=relaxed/simple;
	bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7e3vqN3gBcKWnRYYEBic64bBBQV9DAKij7C0Ad8hTizvLF5ynTnxovoFg9G3xXPsRLaOr8K64Gxwll7FQQNHKNCBUbKtlDUxuszUebOMzUjOj0qLasdShiiNcYD14m4FqU7TqMK9JfLkj9FZoGnqs5411wc9IVTTQHBZrOKQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=njSdUWnw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LZpuNs1j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="njSdUWnw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LZpuNs1j"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxLjW395413
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 12:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=; b=njSdUWnwl3xuSbj5
	TlAvRuKwzHIC+phu+eifbRMk9cS7+qenMJ5P0s6paHP1ExwiBWnHF2oEDUqxatME
	llJ2EEvmKmWsVGHvduRmHzvYhRpLmyFW6Gdw/s+G1IZ7qBFumzsPMaxeLp5bu2nI
	6siQ/upDkAB6yb4WjtVNPqd1ZpFOGpXUgnB/K7+3SD68QPiTT2KfyqWumD+l+u2J
	vp1SPllXZedjBHwXYNWy5blLPAm02q8wFZ5kbP3PMBTOgUKi8WAB2BaK8aCay0Ic
	BSG4WTZnFf7l3acS6VgmCtgFJCCCW5wxsL67wDCp8cp6nPDIbT0hMby+UmyYMqRA
	dPfFPw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpgrtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 12:54:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6a2f5995so501611885a.3
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342482; x=1783947282; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=LZpuNs1j37CSfpZ/DQRStq8hz/kwmekzIrl9kjZOmonDHUbPrE1+dQ6XJ9OR8A75/Y
         MB7DSqbMJ4FB1/jEiNKhmGFkf+kIHskce9bi+0LDR9OePe96ztGACyt8ZzfRPWi8tPR1
         xSvSgIePteS5P4JIY9279hJLD21n3vc7evZKP+OxStgrSWKDjoHw05yE0clyyNAanVvX
         WJjziP3wt6ACYbmh/54dMYz7pf7DybHrH+epFcJz3W99+8E1Vo4+r3rzG4Ymhs6uVpRc
         aYNbvZK92981loUgvb4/+ARlBGAU+M7qV7EN10QyrG+qdTdbdylmWwtHVNFoPX4eLdSS
         yLjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342482; x=1783947282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=imuof45N7Xdladp2eaUFL5GJzPQRNKl57RWZRExjNv0=;
        b=D5V66vdiBt5Zv+j53JhffjIkciMMhXKrfAphz+HQVppOOaYr63UU6vmDD7pt3lXGCV
         czh24nuvYwvRwBIPQixIB1IqL4d/DS7QBByMmsarXjYFNmtNKcvHLTocwvzpx8S9u644
         LayMDLlxGngo85XdoVBZgcBWmC5rvtfFmn5cXzce6QKZU69ErAa/ASPDK8B5Gx3rgthF
         8O7tL7533zTDj3J9FLv4Ehc+FK2y6xBHiHItwFWAWhDF2INdTqLjh7lGf4BqwmcaqmVS
         MBRAM8yhUDnFWcZG+LDmLvpVFxO7vic0OwwlM1JdJyZvClbXBZESM/Y2dHa7jyOCoPMZ
         0THw==
X-Forwarded-Encrypted: i=1; AHgh+RrDP35FI9VdM+tFupIydcDqI4umg7T2/RQACwQBiWKTbr0GIOq5rAsGoSHXKE/V5aUR1EMktATbwuqSNg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw842mIL3xHjdmsjz1SZq+/zQbFWxDwH9EWcMmhkWGzu6xaCT7Z
	VPFd50C/z7KDHT1xZPFkC0DP1Ty4CrkmQbKdeprV0gXX5IoDejDf/gN+1Gbtbyj9Gq7A9vqsS5D
	9UvXyF7YugqUaaiRHBJJyGuf5PEr4gNTVMfM/AwAHDoah4LZHydjUt5vaUf5j7sBRJQ==
X-Gm-Gg: AfdE7cl6kSZxvQTgJ6+KKHABHmES29oO/gt1fJIUjFJViQXgSy7NU2/ggQE9HHJz6bK
	ijpJp+V8yGDw1t8QxkCnSAgk4/w1+6RgardAH+rfp77GYuzWZaeOhNqneZH1mVQ8+VOE/sWilMI
	vmfSJZYpeNXOK+OdJ4bGi+QzlSxV1DtGUGx/UghfeqvtBN5E3LvmjVmrhX1l/kJaxMfQ94cnElB
	BQJ/xCOx9MZu3Tg8JdSgLF1IdG2zTar/EjdP6/qMfpurXXzkwoFrHQavSuSGfuxxOauLygd+DnD
	Y8neh0FiOKkJON1drcgtzoftVn1UNdj7nMnA8wMvQU3q/2Aq1z0v70QgzrVEsC/W61leZlYfouQ
	yJBIGx0vrXF7hlxk0cTow/NWX76aJQqRITgTAixmV
X-Received: by 2002:a05:620a:198b:b0:92e:5ffe:7833 with SMTP id af79cd13be357-92ebb5a2bcamr54651985a.61.1783342482397;
        Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
X-Received: by 2002:a05:620a:198b:b0:92e:5ffe:7833 with SMTP id af79cd13be357-92ebb5a2bcamr54648185a.61.1783342482039;
        Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:54:11 +0200
Subject: [PATCH v2 4/5] MAINTAINERS: add myself as reviewer of software
 node support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-swnode-fw-devlink-v2-4-f39b09d50112@oss.qualcomm.com>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
In-Reply-To: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
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
 bh=wgU5h29ChZnINHlE7+cpZ7/9ziX5loPoQOCDp71wUPw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WGF3whIW+RLqDAnJl2komv2tggoOcvqqnfv
 ocHtTbK2ZeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulhgAKCRAFnS7L/zaE
 wwaIEACE9xjgYSFMqIxeccykET/8UUPaY6JmKvllSX4L/pZkWNnEIoZlQYLc4yR+N/l8RSK/H4A
 CeEsKYUFGtKROlOlbDIYNRUI+z/sod7oTEntYOQ9n5+KVIanY7BC1VhFbF9VFyIycnu6DyB+IP5
 C/s60NpJgqoNBj9N1ZYBps3/n27llPa+Q+v3iNGh6/EgEEW0tCOuOOuHapXNuAN+7O/3pH/2kc5
 UyB60g+58cc1g1T9RZg+zhQei7eyYpjWj2QUc7/nCCgSf1gnr/eV6PyvmnMPW7OBX51vPhwJl2b
 1C/voXGoOpuDkFINlJ8Z2QI7NTF2fgHfOUei/IGlzNofuaEZ3qCqmUcPFvzy1xpHCOCkiSw+QCT
 1yYZ2fnx3Yc6hyFals3+5yytxFajc2rZfz5yg4A7TMB/+XS6us7riipgSe6e2Q2izjOc7pqV/Qw
 cB3JWo4TRsKvxyxM/+Za2P799buSsRIaljMqnqXhav3/vlZwFkyVzqrq5xZ2Tvzl2gcbhfB5y6D
 u/UjA2HyqLvtPX2GuKFyupLO1ME2KOxhHybEcLSkDhhQO8qP9lwsyEG0dNSrolNwwyxfVRHwLo/
 JRubEwo2kDbojKzthKid8G9zvU9sFnV0MwLpDSZpvSxz6MbTj/v2BQg14gi9/vAP3z3sQM7DEaL
 MiNUR9F+C9IQykg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4ba592 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=0-iA9D7a5yEsystHw7UA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: UYIFvAWUtJmU_gH6HX7lSAt7UM24IdVd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMSBTYWx0ZWRfX5wllS14cbKVO
 ze02S+baXr8EDjxiqnOYfvqCWuOCJj8sdDc0q7vczcDljrjCYLtyYfF4GzN9UScjkEi9HWg27Vg
 M7Nlbtil/C43bWNsa7+ebegk43/1T6EE4Adj7b2GN7RpdF41pV140UQjeGyT1sDizcYmDmjbzaw
 SGILTZSJQWFwVZJ7yhbzSAgmZtVQpRipILDzympBrvk/o5QPLFNIeTjWs84E4TcpEXpWiQr75wg
 C0G/pjxmIw8u0QQGsQauEwGdx1KQkLqYX0Vq9A9UOKZQjIVuG4m2tXkR1F/W6PfcG9c2f1YKPYk
 s44/5Hr/tuztVVN/8FdZZM5ob6ug8esSumwvJGY6OfXaHHT1hDFVO8FsD1JYUYXvC/COof93m5C
 j58KR1YHm9Ce5QuUZ0mhIOa5OeP0g8nt2JMfZ+fudr7bH5Ci6ZBl9lhLnAZj6EGob+SkLIS59g7
 /eTCH2ZnrLljSTSSp2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMSBTYWx0ZWRfX4pfxMDPzym52
 KilHbdmwyleJaKoTc5KPz9ywFLOtU/wo1hp5bQMoZWgJN/zB0y5qxrPwH+m5G6EjcjBNUl7weGS
 pZ7Nznl7OtzEBl+34DdTCowDPDp6xXI=
X-Proofpoint-GUID: UYIFvAWUtJmU_gH6HX7lSAt7UM24IdVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060131

I've been working extensively on software nodes lately and introduced
some changes. Add myself as reviewer so that I can help review any new
proposed changes.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d7741614c941ceed9e46e9caea72bad77cfb7618..da886aa69f362f4cb9dc529a26f8dfc67649d7c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25101,6 +25101,7 @@ R:	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
 R:	Daniel Scally <djrscally@gmail.com>
 R:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 R:	Sakari Ailus <sakari.ailus@linux.intel.com>
+R:	Bartosz Golaszewski <brgl@kernel.org>
 L:	linux-acpi@vger.kernel.org
 S:	Maintained
 F:	drivers/base/property.c

-- 
2.47.3

