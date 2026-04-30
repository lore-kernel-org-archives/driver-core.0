Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38ACF3D88FC
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534475; cv=none; b=BSdfurxI+fz0VtLMnx7+teMcS2rHVtYUjZw40fnTvRnCHlMRcoF9WgEYhaBhC7Ok6ND5BYoN666reqgXdUBQwArfBZtWCp2M2QXteujn2NNV4a3J38Ng+GeWWbI76EtYxmebM2T8nLUwj0qjtoTXCdF0JXAmq4WyJ0lkcQcWfV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534475; c=relaxed/simple;
	bh=hnY9WhAyyswSQD7bqI8rIpBTtRvYyhwb49eFS9MHNTU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OxW9gICBuqSQnYkCD2NZhce47jNoOKLtAFjUfUHByenW/bm5bsGsKhHy1qKIm23tRelmnID2qUhCPSVnRGmhm//wWokiVarU/QUtYVy2vi+vfGrSIWCvCcas+ldXC0h22qn1Q5XokfuDZYF0flkOA3FU+2MnKDFI0ecWLwO3mYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMxdWEtY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HLNa9rfp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMxdWEtY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HLNa9rfp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U62bEL2534299
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xSv3gA37ufigJREMdqvUyj
	/7VPLNmpcCpiHXmZyc9xM=; b=YMxdWEtYEBezN5qNojXlVdTG2RjdWsC08rfClz
	2usFSEIU/RFcr8/5AAFiRvE2fz0T6V/MiQLJUyVw3RW2Jjk7BHiE/vHnpbbaEalY
	gxLshA4CwzxKTJHox1HvKhWcJdEm2dDnD57xpGRIQM1OSyYOhU1qLn7a/BJhNv9s
	GSUIcZyfeGb8xnJl/XLo0qU1p72SAA90Hj34JmF7qYzl5Lg8nOlUM+unYB/FP4de
	UIH+h+01ZUVoG82oiGwD3IVn8dyj1s1IFF4Zt6jXMveWgJzPwEV01MOW4t14iKzG
	JweHelkr3c24m3jUT2fpNRUDCcweBI7Sb4+8zAritR40nx3Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dupe92hd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d58bed44aso14391161cf.3
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534455; x=1778139255; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xSv3gA37ufigJREMdqvUyj/7VPLNmpcCpiHXmZyc9xM=;
        b=HLNa9rfpr3d/VqpH1ssPER2VIL0z6LXKBkuIWnc63yIrxEspKciDis3AyGJhmotEsd
         e0UghBI6KPfVrLY83tfQidcLcbT594T5MzGZVpv20rhJokFGdHnaIYJQLw+ewIEoycTz
         63BV2LoE9QRQlnJrVKXKw/lJNU7ptLN+QqxBT+WcSGS+bHuvAjaY8WsMWYgvi+0QZMW2
         Kc+ttGIeluNd3LydRbcNYaTDMOfaqQeX/O+LoK5Md5ooypfPzJBhgJSLIBKxcoyI/FH8
         ef5oxaFstUJtRi/NdCzxm3WOv3/A6qxOGHZyChJfwDtalX0nHysYoxu+/L5xGAPTH0o4
         UsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534455; x=1778139255;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSv3gA37ufigJREMdqvUyj/7VPLNmpcCpiHXmZyc9xM=;
        b=rg+tpb+bv7TGIco8ijCFYnpWNo8nWQzwuu2QgxYSmAIW7Iv/zKhE4Mu7VSRIn+JYp+
         77jqwKlHzczF15ar5+blNEv6RpPAbY5SJEJbqFwwd1IjHqA8CK/6csGWvJ/N0hQaPet2
         bc9hlSbpfRbMqzWNvug+nWh7Iwffglcan4iMyPM2w4lnkC0fM6qeOopAcSFNvwAKVvKQ
         ESGK9+K7sDrluKPp2q5mM2RHWZENrZXs0hE1pZQo8PDhVXjnG6IkXsgzxO/8hE/VqhLU
         Yp4SIo6pqKDUV4pJq1T19Ye1w0m5Kdl6wTHqMDB9BWMK3GLJf9A6nBgfBuDWWREVqvQ7
         maDA==
X-Forwarded-Encrypted: i=1; AFNElJ/3Pfm+1chPGFfilFlR8c2sElu2CD8Me4BG4DKvCe0+iogMARZCKCFeUzTVqudyybqoXfGmhagSidbyVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfCXoElMHkHTTnsuJzM6u108UstPYFZDhTaHCkiQpxaFYYmhqV
	jNz7RpIN015MbNWEBHREsoV6Gli6+Rt58Yg/inKEUQG5UU+cc3PzBZKJ6C4ATr+ut3sDFR4slQq
	yvmBbkL+UiRtd70EU9jAnGYdaXjB16ipkVeqQwdDAcOxkSqB+9K03bvznnVmdUMUKQg==
X-Gm-Gg: AeBDieszGnsWwB6jPKmhMyoihUpVLkSlbL7GPF55c/JTz4FMDSb+e4sqzUU+i/Cr24p
	GsUL1z+6rfKnsq1GLd2Qxzj8omlU9BgOevJeGvIIQIRaHRbRTaWTKr8sni/VRSg1+oUwM0i/JmZ
	kiO+Y66CPCtBtP1B5JDLb5jG+K1sy8gn5Rx4NYr+wR2tO3NDhCYSzZtdtNGgCY8YIIcQQ3daK2r
	MBq6PupYeqM2vAM71DC32yZEjja9tzR6Do7foHiy9v6DgcLf1wjoRdNagdRIeWtM6fkeRjC2fRL
	f36oKjZI3mc+Kwxi5oMGO0k84sxnBc0j2iwEobFtQbTNwlgyHG6o6ywAUuzPjRcekEyT71TR6dX
	fDngJrJ6c9HygopKZkc9vk7O7dbzyqKI0a9jSopASPBdfSlaWK7xYRe5sab+j
X-Received: by 2002:a05:622a:988:b0:50e:5e8d:87d2 with SMTP id d75a77b69052e-5102aad8465mr23024461cf.1.1777534454040;
        Thu, 30 Apr 2026 00:34:14 -0700 (PDT)
X-Received: by 2002:a05:622a:988:b0:50e:5e8d:87d2 with SMTP id d75a77b69052e-5102aad8465mr23023991cf.1.1777534453455;
        Thu, 30 Apr 2026 00:34:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm76132625e9.2.2026.04.30.00.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:34:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v4 0/2] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
Date: Thu, 30 Apr 2026 09:34:04 +0200
Message-Id: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO0F82kC/4XNwQ6CMAyA4VchOztStsHQk+9hPMzRyRJguiFKC
 O/u4KIHiZcmf5N+nUhAbzGQQzIRj4MN1nUxxC4hulbdFamtYhMGrACe7elFjb1XtqEeVUPDs3M
 VUlmhVLyUYGRJ4unNo7GvlT2dY9c29M6P65chW7Z/wCGjQGVuGCuEQrE3RxdCen+oRru2TeMgi
 zuwjyWAbVgsWoXJIRdKaA1yw+JfFpMbFo8WAHAUOpNQ6h/WPM9v3HysSlcBAAA=
X-Change-ID: 20260319-baytrail-real-swnode-7de7a3870f78
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4046;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hnY9WhAyyswSQD7bqI8rIpBTtRvYyhwb49eFS9MHNTU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wXww0JXJj3cUPpeN7kyGC5vtRjoLvkMHCdCU
 WuBTlcVtyWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMF8AAKCRAFnS7L/zaE
 wwVpD/99JfqwXsAJ4nP6xbzNU+tqUqCOObItl3aVI1FsBjcqzPTo1/VLEe6RUQ3IFgmezepeDeX
 XR8oTT/nb0mY+On9XTyLV/0esyKnvoz1TtLsgodHzQ1W0YgyZqRXeUa6g9lEeygSJQzELFqfjju
 PIIRSWNgIRsba9wct5mE1nizxHLBXCHUXGNDlQkdnLf8sAKZyxIs1bfWnRSaXOzG5Im4VY4+Fmw
 RQpDsBDqRnSDVfqchGIXbiSjJ67GhY4UU0kBqddKKIaYO/lGftF2JbME77k3DKAi4T7U2bj5rcd
 2IljBtKYlru8JQtY/yWw010zR3asyeClZ2eAjzZcnLYoPC/E7fads9l6B5SJQB2umfOsWa6r32A
 LfRoj0eSlKNxBgI+CFMuA2RcnPIvC6nRZCjQpgyZYSvX2n0tf6GmVMteTXu3Rs2LsoTXQz8iFlj
 RFf9Bf9STlq4ouBMKKlIWos5jbO5vwthtzI79gWulWEiQaiz1WAQunSCysFfkkOo+C6pWAeURjG
 afv9U/vVZYJcdEXFqIbb1B9hSDH/X+QWbyvzGtlf9vs/Vhg1/vgxcOvqbMjX50910lcxuv0/VAt
 L7nCrAjjIT5K9KGk9YFtHHMI7DTCUs4Dv64SYOVXw6Pf5rBkFByQ99tc3G32UbRTrk0KFSCKNh6
 /+jbRspnZIckYCw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 4rLSjhVVB3ejcvB86my1xvO2pr3GzLFV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfXzq/2QQDQvRIq
 1d47UIIelcl1/U7Bj5OHTwYONQbm2C29UARb1zVMx6D2H5m1I5LQmyHsR2R97eoOMuDpe8lrBLN
 QamQxP4Y+oHnG4pGcQjKkq700FKXPAnJUPB6zwborZGYPbXCl1uBZFBIhe2uGvHAuP9ThgGBlHv
 UDo/fyc4P7JD/IWBUFANRPeINvehIFcnaHJ1tERhq9sIZorVrMsF5iEb2Gq5rD4S4PIlMptkr91
 N4iEgtL2p5NE4cVhfRkuFdRDLyDuQEhJAAXaEkz9MmOZodXTrByDeUB3unT7mpCt/mzLU05mtPq
 TahcSdb0S0RKjONJaUmCVmMrwpdyC9XGVGDnGkThh0PfKmfm23JcnmS0k3KB7mvw4Wha3cuX6Gw
 JO9zOlPy/anvjn6cGYJ3q8YGud8SntUIawwRFM5rZgB3gQxiWGPLeA9wMhLFO5xU1mKcdOr7gqE
 xDAUl3G3cNBI7io9/wQ==
X-Proofpoint-ORIG-GUID: 4rLSjhVVB3ejcvB86my1xvO2pr3GzLFV
X-Authority-Analysis: v=2.4 cv=PvmjqQM3 c=1 sm=1 tr=0 ts=69f305f7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=sB14MePOP5e2yt9b4dIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300072

First let me repeat the problem statement:

==

GPIO software node lookup should rely exclusively on matching the
addresses of the referenced firmware nodes. I tried to enforce it with
commit e5d527be7e69 ("gpio: swnode: don't use the swnode's name as the
key for GPIO lookup") but it broke existing users who abuse the software
node mechanism by creating "dummy" software nodes named after the device
they want to get GPIOs from but never attaching them to the actual GPIO
devices. They rely on the current behavior of GPIOLIB where it will match
the label of the GPIO controller against the name of the software node
and does not require a true link.

x86-android-tablets driver is one of the abusers in that it creates
dummy software nodes for baytrail and cherryview GPIO controllers but
they don't really reference these devices. Before we can reapply
e5d527be7e69 and support matching by fwnode address exclusively, we need
to convert all the users to using actual fwnode references.

==

Now for the new approach:

Now with the recent patches I sent or plan to send out, it turns out
that almost all existing users of software node lookup can easily have
the software node's representing the GPIO controllers attached to their
target devices as their primary firmware node. The remaining complex
cases are: pcengines-apuv2 and geode-common but in the first case we
have control over the creation of the GPIO device - we can assign it a
firmware node - and in the second case, we deal with an MFD driver so
can export the cell's software node in a header.

The only remaining use-case where we need to reference a GPIO controller
described in ACPI from a software node is the x86-android-tablets
driver. In this case, I think it no longer makes sense to propose a new
generic interface. Instead, I'd like to propose to keep it as a
driver-specific quirk.

This series proposes the following changes:
1. Provide acpi_bus_find_device_by_name() for looking up ACPI devices.
2. Implement support for dynamic assignment of secondary firmware nodes
in the x86-android-tablets driver. More details on how it's approached
are in the relevant commit message.

The dependencies in driver core and GPIOLIB are already upstream.

Merging strategy: Both patches should go through the X86 platform tree
with an Ack from Rafael.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v4:
- As pointed out by Hans: we don't need the notifier logic so replace
  patch 1/2 with another, providing an ACPI helper for locating devices
  by name and simplify patch 2/2
- Link to v3: https://patch.msgid.link/20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com

Changes in v3:
- Drop dependencies that got upstream for v7.1
- Rebase on top of v7.1-rc1
- Link to v2: https://patch.msgid.link/20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com

Changes in v2:
- Completely new approach
- Keep the cherryview and baytrail secondary fwnode handling as a
  driver-specific quirk for x86 tablets and don't introduce any new API
- Change the return value when resolving a reference to an unregistered
  software node and defer probe in GPIOLIB in that situation
- Export acpi_bus_type for use in x86-android-tablets
- Link to v1: https://patch.msgid.link/20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com

---
Bartosz Golaszewski (2):
      ACPI: provide acpi_bus_find_device_by_name()
      platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips

 drivers/acpi/bus.c                              | 13 +++++
 drivers/platform/x86/x86-android-tablets/core.c | 78 ++++++++++++++++++++++++-
 include/linux/acpi.h                            |  7 +++
 3 files changed, 95 insertions(+), 3 deletions(-)
---
base-commit: 085f14acda1c46ab815605ecf2341afe5a691eb9
change-id: 20260319-baytrail-real-swnode-7de7a3870f78

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

