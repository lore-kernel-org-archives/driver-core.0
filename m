Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620E535F608
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 00:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312803; cv=none; b=Ajs+STfa5EjAcYm8LUPz09WEx5EkHQGW0DlzhNntErS5eGqoyRCvhbfTE9DXh+DlvVmphkhhLJaLfiU1YW0T7D3nFR8PHdtrAZSBr7YJQaqEaotWIDw5UYVuK/A+ClNCbGvCP20tJvQsSQ+1czCUqAukElNusIWXn8cMDoirAaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312803; c=relaxed/simple;
	bh=WAA48TAgXPKh6OTsM9jfu2LAkNr3B0EfohpnQi0pV2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ocFSgcFXge/GMbcoj4CIxtSBASJcSZnW4pcbx+3lKgmRQdpcYgPaMWj2USB+r1jolGScBeU1hjGd6XBH+djNs1r5MatfCBTZMs8fwtwEJsoYau4FqKLtkO/ooJb0Yzu2W8fz7+scB/6lY4ST8TOzsS+WT/Eaoy/rRcbOfc+je6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pt4gwU1C; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt4gwU1C"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12732165d1eso1187079c88.1
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 17:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774312801; x=1774917601; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VMnha1VqvY6bmQXtBiFyEl6o1L0XqC/h5XlUXxbZCb0=;
        b=Pt4gwU1CmW+O21rlvn1+n1ZBwHtVn/uzcfJP/DYlAw6QuU6gcY8B34gFu7Tij9N9CP
         mQwVqLnyEWVo/jU/rrRCPAXNXtRjn85npY1YtaVt957XauIhx4F1Z9yOvD+nu3xWZtv3
         63DRC2daIqnXLnA36E2jPsU1sWR0K6kFRywrAj96W9Kgla/iM5RtPhW6FWyKOxwiBPSq
         WaEfN6Ha6VpSoyXhTcT7PoSLu+g5JQXoLmjSs4hks4gXt9iORpu75nGW0YoxMkQSSTnm
         cTqVMUz3aAHIWQoVd3VYJx/ckTQz/PkE2U+REIB4Nfrtwa3/uVfrBb/1P4mc0+vV4wIW
         ojMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774312801; x=1774917601;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VMnha1VqvY6bmQXtBiFyEl6o1L0XqC/h5XlUXxbZCb0=;
        b=PD/p/RNjy2n9DOPm2u77hLfmG1SMasvyn5pfQPhOvFcwUw90LDIu7uRgfsbPArjkTN
         tRtxdLKLpzvob9Ih0RXNC2XOVpzA4dym/B7ir+Xhc8iyrCpgE+kORepzmtlxitVhyeI6
         ntqFfxilEZSmSh6pUVfcB+vVVz25MiNY3ZBZFIb1VwDNVTGaFMbV24Llor/cpyTUoLvz
         k33C2LiKnWKH4btdZqMBZT5wNwXQYMjxLwWONbEzg78hKPC7ilgZz/86llMPlF4RFzZX
         ex6t9dT2/nISR7brIZKBzS+8jeqYl5xgWovsS8LXuXrXWoc8FM44vmXIWo2qMisher7g
         O0bw==
X-Forwarded-Encrypted: i=1; AJvYcCXBY58tcyg03gwcTsk/8V85FAKkFinpUexO/NG7twmWx0mGPPjVwkdTlNZyigvV7tklvCckEnKsq7C1NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8B23EpuvoRRuNRHPMvOTBZ/xNZPus5If3AwJW1wK8VNAHPPW6
	M04Mr929Bof9wEUnZHB7CU5TZpgrxcM8Vd8UWY2y88xReJ/Te05LkmZ/
X-Gm-Gg: ATEYQzzcUzzidDHoMDW0aS47a1XO+OP6CFwCZBpAhD/5yTAghD5+Cr9bxUBdtNYVoEs
	NMIiVLZr+OgWlod0OfbHta+1WQq9AlgomCjln/dAbgGat10+6VHqSI37R7EDLN2XS+zVbpn+on5
	3303qg4ym64iWgvxHTH3yjQuuAgWHTwxVTNy6qg/fmlY2UM5swB5LdkheercRbAJdJe7CVLZkGH
	rDPw2NRrax/kZI44TvA+kY57e1m3HkXX+DKc5px1jERv+gPoIerJe8fN+IqTZJeRLnf+vusTTu7
	eFrbWBNH/kIR/jVwEY5goe62WTz6zACQiCIzjqk0xQthdQELg0Zeu5p0vLHsRmZDktbHydXCGxV
	r7p59Q7MJaoiY5+bexaE7fVy+hS37qYxPk/wZ29sa25thQdEOLgTkLqLMCKNB82AN5tUiya68c2
	7PfxL87rht8Tv7zWY9ColVS4nz6SgrR+xOyvQJLK8wZaN/phXeaiQYuAqZanbMDSuSTAvmduKZN
	v34MKycLy64Bdg=
X-Received: by 2002:a05:7300:572a:b0:2c1:564:7127 with SMTP id 5a478bee46e88-2c1095a5b97mr5955288eec.4.1774312801221;
        Mon, 23 Mar 2026 17:40:01 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b90dsm17543148eec.10.2026.03.23.17.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:40:00 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Mar 2026 17:39:38 -0700
Subject: [PATCH 2/4] software node: allow passing reference args to
 PROPERTY_ENTRY_REF
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-property-gpio-fix-v1-2-9cb46e5fe7df@gmail.com>
References: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
In-Reply-To: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
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

