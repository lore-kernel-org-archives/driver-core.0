Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793218537;
	b=tqSbynvUrvS7Nbh72QhpadWE8fAixix2lBm/ULxlL4e0GU88aaoLiJLInOXCmGH8A7HY
	 m0ucVdIhTvL3Vqnyaua7lPi5OK2JxehjMezUgTSubLF4Z7JAXGUKOp+TFJIjbs8hAJ3Bg
	 MxogLYcx9Y1NlfVxYzWzFrbNFttPzWB08JxNqtDarZvj05/OwZmdyhM+1UfEM7cbfAeNV
	 xsxLQoEk1XMT7mq3TzhfVsB6mYZn7eRTGFE738vASik2aStmNideG9MvZGawm0MtBTJ8C
	 6EuvAky27Ru4AwtjFXsV26S3ULDbMypZGWHdxBnzBGcevBvG/GaWRfIG4nizk5ycyAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793218537;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
	b=nqmAbBbbujv/8EppFILQCDDwxku192hUd7UDby0InQj2utaNZsgOSU1EjdB7c0/KC79z
	 vX04f6vKmFSXCJvWC+AMElJq0z5uVmpWHFOCbzIqB8HbSb9Lv1BiMsWFZA3+1T+F1Mwl6
	 wXyat+ibYTgoDWXB3wj/7tz3rSbfXdAIhAXRV4MmgVLsJk/6TSfO0eai32JPwqmG775ax
	 +sj5XU6dozAaPO3sGUr59973owae56ftSaDA+eSch7dZ87NHq5xtu8KNnFt8goX9yxLza
	 qKqPaDLGepag2ySOxa8nBnMvyiJOXhDaAw0EoytBhczK/whlezRR3e6yXZicNGhOTGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMKlCiiH;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF4606A31A
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 20:15:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CF4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMKlCiiH
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-54cd7de2d42so912953b6e.0
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 13:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793218536; x=1793823336; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
        b=mMKlCiiHcWGEdhax/HX8/KPK81nxDGyh4JyK0uSearAM0C7X/zLprSFKSxATech8iX
         3E93/WWVyxCbm1Q/XnqSjXHJkhJI8Kl8ZO0/Wwm00Y88Avu8g77zdKFkOTs2MGVrzeK5
         TVegdyPReoRvHv5TAuetbq0uoA6P6VBbuMdWOFLU1zJRx166xo5sJ2dmBbK+9rfNZ1cy
         FvO3GgTRW0Lqqp6l7fop/lryOjjyHvL9woh/4Kg2QAgjrxzoi1MkOKaDM7q5CYM7OeVS
         dYLZuRlNqWA3TFbksfe8Iv1H726yB9e/IUaobyagdlDUamwMxVVxF7IpH57sq2aufm9V
         GcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793218536; x=1793823336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5SaDttjyE1P2Q+RnPlFhRdc3myvwGH+LK2ZH/fnGBJ8=;
        b=thIzihzP6HZWclS9NIK41kSalqY2H6pUU0Pkdo6JClx3HwrhcAFOjsKZUwF4yOB/U+
         Bi4JLzdKavF0YQ/Z4tOSAv3pf+tgp8bI6xCR5Ou+0IvV14kp22BHsVPaEFSHTrihKgDH
         JiwgcokT/JBgIv3n6PAVxDjQ+J+Dm3pLvGvZjdjiLCyTchsBDkNci03nX6V7WJU8VAv+
         ArQnOVno6EDRM1n0zUWoKmw8c0F8yzW2yHaS2B3tXT48w0nlEjiIANSIXNhq9TYaR66R
         LoBlMUIgL0VQ1R1fCp6ExY+h01fzp+C3mBPV+Llxz4SQruN47BoVC6WXqRNqjvjKZP8q
         QkmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM6TCbsOlg96sESdsbQIJBssYRd3JdWuBwEw/m/NUTiSic3pfv5+XbRX+zqSMcJwa1mvJO2AG/e6CtUw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLwUZz7NEJCFscSp7xOUwjjRCNPfv2trpqy+N/HCP7sE8f92Rwh
	BW3KhcLxNw/1Fom5/TIDn6fosa9SzZympDWvWfUQ14FCdkujcccFbs1/
X-Gm-Gg: AYBFou04mo15jpPLyPGrllWDhzaQAG3LfgUB5jvityhSEcnypQdWTKT7fNIFsXSPBad
	G5ZR2Sgx4lI1jP2uQLEQ69WYsLihnN3gqXaAcp/MS7HXWa5yUnk2DKsFyG2Ux/Ul/+FgmnHuXN3
	jErAS4hwBGalAcHHMlnJhe0qY29AToxmv2XsU6ot0En+YRNgN+W3kQUSdxhx9TrfKvafJy9dcvw
	V7bJwssoi/q5Jv6NTZeGA0N1p+pAvNjSY6b+vnd81D9E7Tjxqff/EAryY7wK0hRxoDlR2/bGBjP
	Xm45nZv78CXpEhSV8sdulc2JaKEzARW0ldo4uyWooQXPsMnxMKwVt0ul3FjvdlkSc2FayLtZ41z
	klVF/cB3a8qpes0JFmKrJ+vJfNb/5bk+oz8f79x10at9/l8xN5HZXbeUMfLaung2gdct5Evj68S
	qBO9PwNPiw/+uGsQTzukgw1y3uAM4QeF2FUhxwulal/MWz56TF54Xb13WA4FDY/52qfWYDgJW6b
	phrREJAnL7WhqdU/oUCSHzHbF57y6Fl4YBEBmcUSugwffO5miqBPsHeiJO62K0E70RrJCeHOklz
	4rebMkyqfcLynYiYaiHjBJmlRZ5zI7cK3L9NbLi+8nwsY7urfo4ShO9dFfgZXYXusoDr0gE=
X-Received: by 2002:a05:6808:11c9:b0:4d6:90f3:74a1 with SMTP id 5614622812f47-56384299008mr2445215b6e.44.1793218536050;
        Wed, 28 Oct 2026 13:15:36 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-563c363902esm2219826b6e.2.2026.10.28.13.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 13:15:34 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Shuah Khan <shuah@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH] selftests: firmware: compare uploaded firmware through a pipe
Date: Wed, 28 Oct 2026 15:15:33 -0500
Message-ID: <20261028201533.158536-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

verify_fw() checks the data read back from the upload_read sysfs file
with cmp, sending its output to /dev/null. When the output goes to
/dev/null, GNU cmp only needs the exit status and treats regular files
of different sizes as different without reading them. Sysfs attributes
report a size of 4096, so the check fails although the data matches, and
the test stops at the first upload:

  ./fw_upload.sh: firmware compare for fw1 did not match

Feed the sysfs file to cmp through a pipe, so that its contents are
compared.

Fixes: a37ddddd8603 ("selftests: firmware: Add firmware upload selftests")
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Seen with GNU diffutils 3.12. Tested under virtme-ng on mainline
    62c457528529 with CONFIG_TEST_FIRMWARE and CONFIG_FW_UPLOAD: without
    this patch fw_upload.sh fails at the first compare, with it the test
    passes in 3 of 3 runs. A copy of a sysfs file that differs in one byte
    is still reported as different.
    
    An LLM was used to help with this patch.

 tools/testing/selftests/firmware/fw_upload.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/firmware/fw_upload.sh b/tools/testing/selftests/firmware/fw_upload.sh
index c7a6f06c9adb..1b234632b611 100755
--- a/tools/testing/selftests/firmware/fw_upload.sh
+++ b/tools/testing/selftests/firmware/fw_upload.sh
@@ -53,7 +53,7 @@ verify_fw() {
 	local file="$2"
 
 	echo -n "$name" > "$DIR"/config_upload_name
-	if ! cmp "$file" "$DIR"/upload_read > /dev/null 2>&1; then
+	if ! cat "$DIR"/upload_read | cmp "$file" - > /dev/null 2>&1; then
 		echo "$0: firmware compare for $name did not match" >&2
 		exit 1
 	fi

base-commit: 62c457528529cdcfa32bc52b331ceca10f3937b6
-- 
2.56.0

