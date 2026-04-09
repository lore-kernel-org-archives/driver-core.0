Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF73DB655
	for <driver-core@lists.linux.dev>; Thu,  9 Apr 2026 14:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743211; cv=none; b=V+VU7ipNFr5lFuF8/VJq7yaOEWADti5L7GjsTaqXpYBg8Z/nOF9xpuBAKFl/G0M9QnK5ZNkqA7ahFDfMcwud3d6Sj/UEIw5mhXcuhU7UH6aLwXr/0ST7OiFyJyJ5rb+DWzccc1E8ZGpADX92tLBGW/uKaaF6hIiUB4ZMoWlZaPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743211; c=relaxed/simple;
	bh=SZcr7dFFx/HqG0JBLpYgsFWXkSiAbQ2w8LnHJcDf3+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FIXxsmclYUYVDgLseRxSw//MFPa6JLN4k27A9Bqnmy/JLRtuBQ3+Fwwd5OhPE2rUqMK+guEjRkiGCN7rF5FHXWMWDO6gtKDVFHTH1J9BIq9WRMt+8N/BbDxmivabeMYnUEVRTJ6pezzkh7BNNj4vW6qqMN80FuEJXKoyLgqhSmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=erBFKGmE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DzSj1f/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="erBFKGmE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DzSj1f/j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CMc3w4107652
	for <driver-core@lists.linux.dev>; Thu, 9 Apr 2026 14:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=; b=erBFKGmEWFstHqVH
	W+0mQ9qVcsShfVKoVuUM2/XIIDXjGEZGaq1wseDsDNhqYDAWOoYTspdcZGmakeMc
	p4/jOnQiCMvqBQroyjl2ackELhwpZm7sauHLFo0v6qnsUTBlD9ReWbRbCYODKQsD
	5uJ5sGG0MRBi6IUhFR5bzJ32zA4Ce/WCTE/REqjikMFIFNxi80j96QR3ewbRTpky
	QGtLHuMyY/A6e/UFu5LtLZqH0WVrP7M9GMjRkQhT7XIdscqPGmUgSMBrv2jsO0Zf
	yuMUfyM9C3sn5jUXgrwThkfy+PHQbnXwM4Rdmz4eRnjAxG8uGfWthAs7lph6DAGt
	XPMYIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddxhak7wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 09 Apr 2026 14:00:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b220c72bbso3147731cf.1
        for <driver-core@lists.linux.dev>; Thu, 09 Apr 2026 07:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775743200; x=1776348000; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=;
        b=DzSj1f/jhlHvpzwFBA8rgBNaKooNkH0WaOV9Fbsmx1EsOIzIB5EI2f3nGwAOWtCFut
         leUiOh9u6VlccOs9EiITMBIYd+WT2g6/vi0wIs6q/GiY2AIsdS8wrhvKHj74T2CLHYKk
         s3ZZ30ZAcT0UeTNzSJlVXSfTVVmQaK6cm5Sh57HdQ7dQgOwZM0+nv+b/d30h2w1nm7rZ
         9gQQX7u0Qvf8fZ3hN2HNz9wlcyn9bYb5wsvy3Mh4zohRB8/wQ/iYB2Rl4Yu1iC70k5oY
         Ptafts5S100zJRY41JVeaSWChp5S9mtZ3X+G6VUnh+KO1Ot9lozTjUsHJfIGZQnh1+NK
         u88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775743200; x=1776348000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r31whLi7CQ0J1EL5aLItfX5SVplnR48JHc5fhjXLdz8=;
        b=OwVEnlPIvojnW/SwUTe9wDDudnnU096/R49fY0iYieRxGbtSqN2+GQ26bE/bl6DLKk
         lihCLJuJaEx5GOYZgSd8KsUwgaMmUcye8hDseXRaMi2x0uQVeWwK95pYGwgvSQRsB+dH
         HWY0zv7SXgguxWy0A6uTeED3YVcuNaQREZHEXgJPVFar5yGIoUfxV3njlYbDsX/Ow3y3
         sHDM47u3U99G/1APXIOjSFASC1rMmShQ8ux8KMV9bOgHMuoX4GRBMyiX1ljp+j7BJYeq
         O9u9X6MQrntrYNUQeXeqUx8KrS4ZPmjjmSMQv8i9ECeK9xIJ+M2BM/WbZlly3NyoU6tf
         Dn8A==
X-Forwarded-Encrypted: i=1; AJvYcCXMuHeKs0Hsep2mnz0x5GFId7ELcEoka+7fBHiYA9UFxqqLYScy8t7QvbAX7FaVmWByeJnNzunRtl/xeQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIgxlKKnE97V2j4Z3SNOj+ISry6GDmBEq5xAGjSqSRG+otBGPN
	WMpxM94CRAddwirvUYw4KbGaEwjKMtf8yMn975yVxpjRzZIGFDF5WMembVn21lQ/oDeSr0/DWdz
	CUsTirr+uwSplkxZlbCiJbl5D2xrztiAzRmp8r6H4NaJPp+noeiBnD67Ugwyzb/pGYQ==
X-Gm-Gg: AeBDiestDdqoU3VrN4tQh5u9WTVsEFF84FrgI+MglxW0kXBQKujb8nOal0kvycvm+6J
	WHWrME/6IcdynQNEnkRhgWmMe3MORdNt0g6lTLfQ/D4g0fuTNvoohC+esQwLdNmkRIX0vxtZvtV
	x4UsQQI6H+Lz5+HtgKKFotNqmSyaSCHVvmVj7F52spVn62venY8m5x5U9DJ6RSUrYZO3oQxb8Yg
	dCqC3yJuNLNUhjLMtUua0pHHiCkp6wrzfrdFfg/z3neIX7dqnXHvoENbFqODG2cmTvSz3gvT4eh
	AA6lWjXZMOkDS07vWQqLfF7Gf7VZkkw9ky6wO6XWiXggr7htqJ4TzdAPx5O2L5H/DzrwKOJY1Gk
	/VIQyqyuyx7gLMLtz/yJ9dvjLdwFNZf8MlBJtEKZVehQuRSTmlQ==
X-Received: by 2002:a05:622a:558b:b0:509:3098:819a with SMTP id d75a77b69052e-50dc22dd2a7mr55274341cf.44.1775743200019;
        Thu, 09 Apr 2026 07:00:00 -0700 (PDT)
X-Received: by 2002:a05:622a:558b:b0:509:3098:819a with SMTP id d75a77b69052e-50dc22dd2a7mr55273731cf.44.1775743199450;
        Thu, 09 Apr 2026 06:59:59 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:2346:762:14f4:8b01])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba180ffsm117373666b.35.2026.04.09.06.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 06:59:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org
Subject: Re: (subset) [PATCH v4 0/2] driver core: make references to unregistered software nodes a special case
Date: Thu,  9 Apr 2026 15:59:55 +0200
Message-ID: <177574318973.111981.5466026181315933610.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
References: <20260407-swnode-unreg-retcode-v4-0-1b2f0725eb9c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: dB2HHYiE-ATPI6XUX5i85lGSy9z_1_h4
X-Proofpoint-GUID: dB2HHYiE-ATPI6XUX5i85lGSy9z_1_h4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyNyBTYWx0ZWRfX09n0y+OOvr1/
 G9FkwFVcgudEHh6vaBknIU77BZWDGSu4PY2vRRnmW8RvZoUfj12Img/Igpa8+BmeZ4vUYZXg9oJ
 Ygg3mxSXwNQ3MxdcOcROAll2V8hqhGOGaYUJh0ZNDLKqz19wYKWm/N2GNT1v+t26I5mjYk9+LLF
 c0V54Ja0KbBZU/giejoBS9sYabRYiuievB78lJ6SUqTZsz9SdgWX9vLp6KXgFh2AHyXv8cBUgdI
 ul+4kxgP03feem0kuHzNkSht32sx7CxZpX7bkAc1ICQOBd0GqSWxoHxYo8X0eWBrKrYdQABwvKS
 gYyoAj8trgNv8mWSuEThzcvdXHbCGsOTMCxXhqyBSyXBHizs99XfN95v9rigfSljK73dZIZ6LmI
 OkNjZ6g6lumR+cSMAZuSKAkTlo8x1Be/S8rApdi2ONPnDDMhUaTu13Zew02IgSMAVLBKl8JVLcA
 kjLA3SV9+vhweTgCYjA==
X-Authority-Analysis: v=2.4 cv=BefoFLt2 c=1 sm=1 tr=0 ts=69d7b0e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-2faNgSI12pgEayDPOwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090127


On Tue, 07 Apr 2026 15:27:56 +0200, Bartosz Golaszewski wrote:
> I spun this out of the bigger series (see: link to v2) in hopes that we
> can get it in for v7.1 and make follow-up development easier next cycle.
> 
> This series proposes to make unregistered software nodes (ones that have
> an address but which have not been passed to software_node_register()
> yet) a special case with its dedicated error number. This will allow
> subsystems to defer probe as if it was a firmware node not backed by
> a device yet.
> 
> [...]

Applied, thanks!

[2/2] gpio: swnode: defer probe on references to unregistered software nodes
      https://git.kernel.org/brgl/c/ca13ab654064fee86d6e7c9e87d0af7789561509

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
