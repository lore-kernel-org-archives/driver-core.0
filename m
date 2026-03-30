Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472823921D6
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 02:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774837681; cv=none; b=GVnVlWh998HRFj5mQn66fzyhyMMxvZQ7/J4kDtPBnoq2x9jrBWeUTCZM4M+3cco2+X4I4+eFF6+XzVC+DOMzbRL683kKszjy8MFU4Q7AcGeL/3NTINPBJJFXtjIPjk1jTHfGh9/BaYQ3HxV+vlnwFopv1+Rw+ca4t5f7CnovPwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774837681; c=relaxed/simple;
	bh=WAA48TAgXPKh6OTsM9jfu2LAkNr3B0EfohpnQi0pV2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L5NlwmGMQXZlXiqML7gp+uMkuk3CruWeFUxN+KcSSHEoYohkCeBQwG0QHbfrm4ngvczGT1Angmqvrs8d0Vd2cSCEZkB1hAfGKatczAksZ9f1hSmDuzvYBLpohUuSIxYijZEVFcSaMH+Djacbtsa6ZH7AGBsowRVBEewTctP6E4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Te5hp9IK; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Te5hp9IK"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0c955a481so1096317eec.1
        for <driver-core@lists.linux.dev>; Sun, 29 Mar 2026 19:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774837679; x=1775442479; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMnha1VqvY6bmQXtBiFyEl6o1L0XqC/h5XlUXxbZCb0=;
        b=Te5hp9IKNo9xzsLVnYcZ8q4YGeZNlJMZCN2p7SqnAUdlyzRom85oH1xt9n5CVkaTaC
         zXASMtMiL9yekg/WAOmxdNJiVqeczrTyrNVU6YlgpR74X/HLR2uju5K3VPFZh7cb6m99
         AHd9yEwomMSdwOjL36IAdP7OHl6KCN0o8whJITEaD91P5USpUPpqGYg8iEGi8JT9GQU+
         YHmPB48tCiwNvRTEo+DtIp7IGd2PrbOAFSf0Kp9lsURmzD9vNZUZgdQ3Qk3uIG32nE/8
         NlLTWfPCZLhyE6m8iUbPBo6MfRkgtqNDYdxXsf6eMXlpvRN8AtTMV7992UiiRCuy5VzG
         /4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774837679; x=1775442479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMnha1VqvY6bmQXtBiFyEl6o1L0XqC/h5XlUXxbZCb0=;
        b=JIEOubbb0XTpxurHW6pMb8hBU2vK9LyJjQS43N5lvq5BazP/bFr36JNy+9IpLza4Jg
         JCQnM8iUrHP7JLCE/xCURp7uxft9hSTUQHnzKY93MFTGRVj3FG9AEmYm6gKd2Ho672+z
         iH52A6RrHxT8VFkf61A/cUxS9m5YNb+r31A0DHBVGgfWn5FXI+ek7/LrLJt+zicSymSB
         6lWLX30O8nhYj5aW/XkCfBHtH0w9b0x3ddwKWlPktAlIKKX9cPc1hGo+OsEsOuDAAasn
         DxfSXDJgl4z4e9IB1tMn2BbP7JcfjdxKZTm9JOBmknmEQoVdzbNYpMCnlopAxlfaB72K
         9JMg==
X-Forwarded-Encrypted: i=1; AJvYcCUBkQl3bgSpK/M1hq6f6MQdcOh3H14ljU/SagFzW2+V0Fb+5q3Fmb76Qld5Kln4Z3mdGr7vSto3p3x4sQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJj3wHR2jp2zuBmsJgNlx0Y+AOydgSPqM75NZEEDjXEYj8pPmk
	7PuIdsq88gI8r1hNQhO9ySBF5m/voS0cI8XVeEZZdl5WguHF7icsk4CZ
X-Gm-Gg: ATEYQzxyY6n02oGAy7NHGjwi8b9cK8t31SnKpkU6syb1surhrA5Kixw/AjXtI+QwZ2g
	rFhWyl2F7vogPY9qB1ub1q+VJFvBltxbV+k7GRW3R1eOg5HtpQnhnaRBng0Ha6D3cdinwP9JCjn
	7mptwNZqsoHPU3LNwEZkozt6L4oAIP0NTQKXBKbV73tjxYX3PAcrzoJqcQF0UngYwwo6u7cSuI+
	h27pP1MYoOuadEQl0NP8dlUZk/Ve44qTgFzUYBn9HIKzx5P+pUzXsYDzdjhLPuyo+qIFnAcCMri
	eU16SPLGew+26ltmCaubuVUtq7BPoz2RtRw/I8LO3/2ogeu+28hFp2eXlvxIBaZBn4rp/tMuV8m
	Yfv5TqzuqZ+0jQV4dNcxea21raE2lSP3l7mSChBj8vfu6T7z4DnK9HeEX/p/z/GntnNP1TssR19
	8F+UQ9mwj5hkuZVGiZHn0deWGC8s3diJtobIfMVlSgot1W2RSr5Hnzv5BOfTOiV3+xUMWLW54zu
	HT3NoFGevarY6I=
X-Received: by 2002:a05:7300:6423:b0:2c0:d9e6:7eb0 with SMTP id 5a478bee46e88-2c185e169aemr6118335eec.16.1774837679449;
        Sun, 29 Mar 2026 19:27:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm6250673eec.30.2026.03.29.19.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 19:27:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 29 Mar 2026 19:27:49 -0700
Subject: [PATCH v2 2/4] software node: allow passing reference args to
 PROPERTY_ENTRY_REF
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-property-gpio-fix-v2-2-3cca5ba136d8@gmail.com>
References: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
In-Reply-To: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Hans de Goede <hansg@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 driver-core@lists.linux.dev
X-Mailer: b4 0.15-dev-a6826

When dynamically creating software nodes and properties for subsequent
use with software_node_register() current implementation of
PROPERTY_ENTRY_REF is not suitable because it creates a temporary
instance of struct software_node_ref_args on stack which will later
disappear, and software_node_register() only does shallow copy of
properties.

Fix this by allowing to pass address of reference arguments structure
directly into PROPERTY_ENTRY_REF(), so that caller can manage lifetime
of the object properly.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/property.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/linux/property.h b/include/linux/property.h
index e30ef23a9af3..942657e76993 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -471,12 +471,19 @@ struct property_entry {
 #define PROPERTY_ENTRY_STRING(_name_, _val_)				\
 	__PROPERTY_ENTRY_ELEMENT(_name_, str, STRING, _val_)
 
+#define __PROPERTY_ENTRY_REF_ARGS(_ref_, ...)				\
+	_Generic(_ref_,							\
+		 const struct software_node_ref_args *: _ref_,		\
+		 struct software_node_ref_args *: _ref_,		\
+		 default: &SOFTWARE_NODE_REFERENCE(_ref_,		\
+						   ##__VA_ARGS__))
+
 #define PROPERTY_ENTRY_REF(_name_, _ref_, ...)				\
 (struct property_entry) {						\
 	.name = _name_,							\
 	.length = sizeof(struct software_node_ref_args),		\
 	.type = DEV_PROP_REF,						\
-	{ .pointer = &SOFTWARE_NODE_REFERENCE(_ref_, ##__VA_ARGS__), },	\
+	{ .pointer = __PROPERTY_ENTRY_REF_ARGS(_ref_, ##__VA_ARGS__) },	\
 }
 
 #define PROPERTY_ENTRY_BOOL(_name_)		\

-- 
2.53.0.1018.g2bb0e51243-goog

