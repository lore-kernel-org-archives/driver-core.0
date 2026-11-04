Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801048;
	b=Zn+o3AG8TVWVYUF1b8ZHH+Y/x64RsWoWcmZ5WfNOPjTn87P1c1oQEscPu17qR24BuFwC
	 T44L7vdZ+9juCuuInAVm81vUisbPw6HPlFry1degDjSp2Aeq+43/AJKsGM5xi0fHqsYNe
	 oIBDZY7lO7NBtFjgoPZ7PX/WazySX3G0j4BhUSuBPSk7xuJon/8uRXPyc2xhzyQPRhqL7
	 NYkV+HFK7ufRLUddNFKOzrd0HratLUcO79UFCIvYlKGCgssbqwDoBbTjA8bNnBw/UhMQY
	 3UpYy7gBV+BY4dEWxXgchMzIzcwWwG0Rov8V3wHMQ3GOOK6kbeQFMmmBnQGprlbaamA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801048;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5H3S1tMGwgUyJGGvbEhwSu0HTzecRWvBS4g0moVmOts=;
	b=4blWXjGAAu86JVxvCBI22QriUImo7QRmsnaGMa9idItGDw5pD+Kq8uT2A1VXXHNWH2GD
	 hD/VpbKXaK/smgJCHNynWyyshQz6MQL8HD/FWCtNBLGD9NFQMYO/jsOu/bDVb/iVvjpt8
	 linAQa1dWLjNbeYexyCeBNtPMFl+THVkRUh8bSaL6D4SnNYfDzrCZklJGhfxhGeICImGP
	 hAEqey5WkTjrFjaeyIb9n+gyTSFm0k85pRWikGONCalCj6CKJ8gm9fUdNpWIF9+h+MrkP
	 wntzy8o0YagsVrpEgzzWWTZAqn5KLpsboxXKfyrs49lp7oLRgkQqioeQGRjmAfN4Djg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5unUfNZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jPHQcpjv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638CA606A334
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 638CA606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W5unUfNZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jPHQcpjv
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4BZxJg739289
	for <driver-core@lists.linux.dev>; Wed, 4 Nov 2026 14:04:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5H3S1tMGwgUyJGGvbEhwSu
	0HTzecRWvBS4g0moVmOts=; b=W5unUfNZKe5aOtcct16nGAhL6N5ti8P2ZBzqWy
	bI4XcIlDZ8XZje+hj9IZmcc6StJtjzKfDoANXircBWQtXQWT0v5f7mOZMlRU4TDL
	8NPNs1IyhUcbKIRBFcNkly1KnrkreDx7b+7Qx4LVrFlAZKbZeUHungLsESuhbrqA
	zKxkBCjQK8NvBGxOWJ7CpNTefHrzMV1iL8cy9w2f4Vs2EaJk1faAPxEzn9zuPPd4
	40xckNhvkh4gSZdLsb4k/VRpTRA/P+YPH95qcXkrnzqAX4zS50tMcNWegyAxt7KS
	gpwctoNmVaOFatZ9j//jG+f9Osan8Gr0sTMImCPjVUQBVyAg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163hafw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 14:04:07 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eabb3a1bb8so111589e0c.2
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801046; x=1794405846; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5H3S1tMGwgUyJGGvbEhwSu0HTzecRWvBS4g0moVmOts=;
        b=jPHQcpjvC71RWeNFVQwjtLtGt0eerDMWjJE4BIqugEsHwRNq8xknmt+XSkRB1/M8B7
         SpKUJxYcWhNUsga3Fmv/RyVJbSiAcydnKFr7rmdKknNgkb6GUGk4FJQOGYmFrtlq+Ufo
         fyEPz+oHUKieo8PbRNbyQNhbnHNdBsAnHejHqPbtBxBIU3+D5hW6ZHSikaLAVNMaZUkC
         q4JxQAkjZIagW5pAnkaLb9xDTanOurnL+APurJ+cabD/mdEjaSJQHLwZToDHpLmRQIp4
         VLp2fTeIWNlMaNuxYvMJOd9XnFkOtW2VAJgk9u+r961NTb13eU5+PrGW2YyJWumz6ZO6
         0c1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801046; x=1794405846;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5H3S1tMGwgUyJGGvbEhwSu0HTzecRWvBS4g0moVmOts=;
        b=wwWLzGcJewvkwf5Ao6heyT/vTLY4XPKQAOXfNgfahsRAdfyOgVpY4yevDGLAYuL8WF
         b1j4Ibe3jtRhwYBDm0JHDhRv6eB4GeGOZaKJdipkTYV54BYP2Pj1R083iC7fkHukzMtd
         YMYxATOL8+mkTRpBsQLrq4aCnFuPaRSkeSfK2N+Sqpd7w3WjN2+sG4Vv9IOg5eXyz9YE
         6dK/+ChgPEbIdEyHGdt1th+JYJDRFxAk0hgwlOegxbRSstJfhdvA3VljeQ0Bt6uhWhBO
         9wXIjo5Fin0qAYPxa4toGmKTZC2IXcvGWd4Q7yalC3CLzBN8MsBA+Bz1seBkfzDkc3QH
         P8PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsi59RxmHB9lyCBDjt7s607cRc4vb0ajb6mzuISyh7yG67fIjPzBkocXCDBOzxknkBvs7cUUixsk8W4Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/R6XyIerJmx3oz4MG6QYtt4FkKuQtGxSU15zglVzON/s67AlA3
	Gh5jAeCxCOQXl1RdEcz0/jQbOOHJMyX/ZivxX5s/NEKX45bwcrG/Z8yC9LPYuo3SvMiLDk4vUTB
	ZX/AgL6kFytfozhuIhXQBrxOT9KvXQfJ0yuKpjSTJD7+3Npo5tgGaLu2GE5Eea5eMhKA1wnq/qA
	==
X-Gm-Gg: AYBFou1piwIA1kGneasrpw8QeLVJPGHHeIva164XHmKbKaNVWbzJrbi4Dtgz8oEE4B+
	/t6xSUjuzW5vBEPT5WKH331WgkUW1gCGdAbSadIZAFawH61lpc+y9+Za5zCgcVzXx4QzqetvIek
	StNScL/kfshs+GOHK9m2/MFAUe+fe05DdzdvktYiuTr00PK6aQ4OG8tLJn7Go5liAjBcnZGTR/p
	4rJip3Zm6KXLtMZsaU8VXO8viMGAwmprXSGAWS9M1xHyLja/Hts24tvHN1iarklxNE6dHZs4CjJ
	osHOBhywd5zR4ZX3aznGypsEdWAzxlPglWjSX8IBqQHbwEgNPznouhqzqtrbPvwf3xXJDgiarfE
	DUv5haRFFTPoSOV44rGBD+iJYzmfmKSuyc0Uj3dqgHi/IOtwIsRKaRf+LhlbeLBnrKGDrMvaHW/
	Fawg==
X-Received: by 2002:a05:6122:4d18:b0:5ec:1996:43e5 with SMTP id 71dfb90a1353d-5ec68954c28mr6941206e0c.14.1793801046063;
        Wed, 04 Nov 2026 06:04:06 -0800 (PST)
X-Received: by 2002:a05:6122:4d18:b0:5ec:1996:43e5 with SMTP id 71dfb90a1353d-5ec68954c28mr6941124e0c.14.1793801045361;
        Wed, 04 Nov 2026 06:04:05 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:04 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/9] gpio: make gpiolib-shared more fwnode-centric
Date: Wed, 04 Nov 2026 15:03:42 +0100
Message-Id: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAD4762oC/x3MQQqAIBBA0avErBuwAq2uEi0kx5yNyggVhHdPW
 r7F/y8UEqYCa/eC0MWFU2wY+g6OYONJyK4ZRjVqtQwa/R2TI/RJkOwRMEvK6IzVflFkpmmGlmY
 hz8+/3fZaP07gX/FmAAAA
X-Change-ID: 20260916-fwnode-for-each-prop-d7a6f90e7338
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2525;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=igoKaa0xq26/Z/H02GkPFONZQBTU50ODzHchNUIx+5Q=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztRL7kg4bDJtRdCt0qBLI2rXZeRzJHDf/XLN
 9rZ0LDl54KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UQAKCRAFnS7L/zaE
 w6/DD/9jj9PILd0dgLPtCIwFuHXC3EySMhKlRRrNt4JLWFlDqcNoMOHDNRBV9tAldlTPM8rmbB/
 Q1uKEBZrqXz+wO63h2Fdr4X9hQgyPXJj/GQtw13cxVrohxGzP7+ld9TVcI0vRXx2e/uIPjZgNmz
 W5gGdNmX0Z+OMItPUIkKVegCrh4N6Egr1RgblvNiXLX2p09m9XG1DjWa3pOVE2iL92qdhbQxJTH
 qVwDHhLUE5QsS89kzFM155xrMZkOxClLKlr8uP1wp3ShjHzXU5dBmhZ+WSAo6mVmVbjsQG/wOYg
 7fj51f4Qz1+9gu2c4wUxC6wjRKBGHscBTf+YUbPUgJfRwyzwZQyC5ZP7Sn30Wyc8V+Fj4ZreXrO
 0GJV0Ytx57k/D6HlVXoCYXzhmJraGZ80UB7ZFE2KXe+aEgewMirOWrLvF8faI9Hfl+WnEwAQUkO
 tIR+gqLgL13i0fhxd7OEBqP3UilPv399umJRoUeL7736OAyyL8mjVoVHGMiyvx92Rj/af1ej8OG
 hmHp66Uw0e66dgra3upvfLUChjaMZIkdd/kE/nisXNUAO13rZk/wSJTzhO63HgM0ZUWk3WasThP
 DscsoeoFsZ7W/TrWCW46mX1GsaIykOI1JXtnJmUbK4/gwHd161RAbbM/qZtMBNXqumNtBYaMK9l
 2dk7ovHOj6KhKJQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: mNYvTcYmOGfcrsP8oN2bIEtJ3dPRnu8Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX4V4wV4lQvVcp
 XiAn8KTbvBsc77+w/g3asSgXQxPjJ9ukQRuaKdk86jFR8E6Wa75usmBC26f59ud9yLPmpfSX9/m
 EHGf2eFPZGPFsVYHb/zkcJWe9NAzcks=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX2eXGC23btYfg
 D+0RBY9/K8g/tnCqi/XA/WeUVwUWNpVL+JaeccGmvJCN7s4wqKWpcP5LheAXjHwZAxUosX7iICp
 Gpd2gDOffl99SPrt19xrSfdw5r+gi5Z+9sgeh2Q7j8jCllRM3wHlDNRUgXWsGTecykWwmqByZLN
 wByiVauxh/sOS/R9x10ocGYDSQiLm1K+44ihWjzkplDyMSKe/Zyje4PGIHtebojx1RoqA/s8tS6
 olOSoDi/Ci/dfjvBu/6CRLF6sWmOoRhKb7NS/R4/+OwhxkY1gXoNKwoObG9iX5/DLjGvc4sPQYE
 dhtB1i1STiyDYoZOkX/c96tL9KX7t0qUBMNNaiPV5ZTo6noqchDsL5VuoYRL3iRxFFTfzzB6fGs
 fIlQgPy4TKiqQalD9L9CWr8ADdDAsoWVNhxyGeYQD+VrkwGFpA6zry+7nwB/fsJCbrE5FG34fST
 DCkdMbxglExeF78onxg==
X-Proofpoint-GUID: mNYvTcYmOGfcrsP8oN2bIEtJ3dPRnu8Z
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aeb3b57 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=eP0z8zDUiy-zq6zXBR8A:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040055

Currently the code in gpiolib-shared.c only supports OF nodes and uses a
lot of OF-specific APIs. This series attempts to make the code more
generic, ahead of extending support for sharing GPIOs to other types of
firmware nodes, by defining two new fwnode operations, implementing them
for OF nodes and using them in GPIOLIB in order to limit the OF-specific
API usage to only a few places guarded by ifdefs.

The new fwnode APIs are:
a) property_get_names() - this closes the gap between OF nodes and
   fwnodes: OF nodes allow users to iterate over all properties while
   fwnodes don't advertise all properties in any way at the moment
b) count_references() - there's currently no way of counting references
   in an fwnode reliably: using fwnode_property_get_reference_args()
   does not work for empty references (e.g.: phandle = <0>, <&foo 1 2>;)

The first patch is a fix to fwnode_name_eq(). The second adds a CLASS()
for string arrays. The following 6 define and implement new fwnode
operations. The final patch generalizes the code in gpiolib-shared.c.

Merging strategy: patches 1-8 should go through the driver core tree and
be provided on an immutable branch to me so that I can pull it and queue
the final patch via the GPIO tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (9):
      device property: fix fwnode_name_eq() for empty node names
      lib: string_helpers: implement a CLASS() for string arrays
      fwnode: define the property_get_names() operation
      device property: provide fwnode_property_get_names()
      of: property: implement the .property_get_names() fwnode operation
      fwnode: define the count_references() fwnode operation
      device property: provide fwnode_property_count_references()
      of: property: implement the count_references() fwnode operation
      gpio: shared: generalize most code to firmware nodes

 drivers/base/property.c        | 114 ++++++++++++++++++-
 drivers/gpio/gpiolib-shared.c  | 241 ++++++++++++++++++++++-------------------
 drivers/of/property.c          |  37 +++++++
 include/linux/fwnode.h         |  15 +++
 include/linux/property.h       |   4 +
 include/linux/string_helpers.h |  12 ++
 6 files changed, 312 insertions(+), 111 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260916-fwnode-for-each-prop-d7a6f90e7338

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

